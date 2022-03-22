import 'package:Habitaly/utilities/appearence.dart';
import 'package:flutter/material.dart';

class LoginFormTextField extends StatelessWidget {
  final TextEditingController textController;
  final IconData icon;
  final String labelText;
  final Function validator;
  final TextInputType keyboardType;
  final bool obscureText;

  LoginFormTextField({
    @required this.textController,
    @required this.icon,
    @required this.labelText,
    @required this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Appearance.PRIMARY_LIGHT_COLOR,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          child: TextFormField(
            controller: textController,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black54,
              ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              icon: Icon(
                icon,
                color: Colors.white,
              ),
              labelText: labelText,
              labelStyle: const TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
            keyboardType: TextInputType.emailAddress,
            autovalidate: true,
            autocorrect: false,
            cursorColor: Colors.white,
            obscureText: obscureText,
            validator: validator,
          ),
        ),
      ),
    );
  }
}
