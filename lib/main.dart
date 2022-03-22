import 'package:Habitaly/blocs/habits/bloc/habits_bloc.dart';
import 'package:Habitaly/repos/habits_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Habitaly/blocs/bloc_delegate.dart';
import 'package:Habitaly/blocs/login/login_screen.dart';
import 'package:Habitaly/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:Habitaly/repos/user_repository.dart';

import 'package:Habitaly/views/splash_screen.dart';
import 'package:Habitaly/views/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  final HabitsRepository habitsRepository = HabitsRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(userRepository: userRepository),
        ),
        BlocProvider<HabitsBloc>(
          create: (context) => HabitsBloc(habitsRepository: habitsRepository),
        ),
      ],
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habitaly',
      home: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            BlocProvider.of<HabitsBloc>(context).userID = state.user.id;
            BlocProvider.of<HabitsBloc>(context).add(LoadHabits());
          }
        },
        builder: (context, state) {
          if (state is Uninitialized) return SplashScreen();

          if (state is Authenticated) return HomeScreen();

          if (state is Unauthenticated)
            return LoginScreen(userRepository: _userRepository);
          else
            return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
