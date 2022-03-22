import 'package:Habitaly/utilities/appearence.dart';
import 'package:Habitaly/widgets/general/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Habitaly/repos/user_repository.dart';
import 'package:Habitaly/blocs/login/bloc/login_bloc.dart';
import 'package:Habitaly/blocs/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appearance.PRIMARY_COLOR,
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: BackgroundPainter(
          bigCircle: Appearance.BACKGROUND_CIRCLE_COLOR,
          smallCircle: Appearance.PRIMARY_COLOR,
        ),
        child: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userRepository: _userRepository),
          child: LoginForm(userRepository: _userRepository),
        ),
      ),
    );
  }
}
