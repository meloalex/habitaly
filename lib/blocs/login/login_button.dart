import 'package:Habitaly/utilities/appearence.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 42.0),
      child: RaisedButton(
        color: Appearance.BLUE,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: _onPressed,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Log In",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
