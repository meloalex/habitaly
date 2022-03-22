import 'package:Habitaly/utilities/appearence.dart';
import 'package:Habitaly/widgets/general/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Habitaly/blocs/authentication/bloc/authentication_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),
        () => BlocProvider.of<AuthenticationBloc>(context).add(AppStarted()));

    double _separationHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: Appearance.PRIMARY_COLOR,
      body: CustomPaint(
        painter: BackgroundPainter(
          bigCircle: Appearance.BACKGROUND_CIRCLE_COLOR,
          smallCircle: Appearance.PRIMARY_COLOR,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Habitaly",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  fontSize: 38,
                  color: Color(0xffffffff),
                ),
              ),
              SizedBox(
                height: _separationHeight,
              ),
              Image.asset(
                'assets/images/onboarding.png',
                width: 300,
              ),
              SizedBox(
                height: _separationHeight * 2,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
