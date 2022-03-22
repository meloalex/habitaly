import 'package:Habitaly/utilities/appearence.dart';
import 'package:Habitaly/widgets/general/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Habitaly/repos/user_repository.dart';
import 'package:Habitaly/blocs/register/bloc/register_bloc.dart';
import 'package:Habitaly/blocs/register/register_form.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key, @required UserRepository userRepository})
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
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(userRepository: _userRepository),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
