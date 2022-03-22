import 'package:flutter/material.dart';
import 'package:Habitaly/utilities/appearence.dart';

class CustomFormTextField extends StatelessWidget {
  final double boxHeight;
  final String initialValue;
  final String hintText;
  final bool autoFocus;
  final int maxLines;
  final int maxLength;
  final Function validator;
  final Function onSaved;

  CustomFormTextField({
    this.boxHeight,
    @required this.initialValue,
    @required this.hintText,
    this.autoFocus = false,
    @required this.maxLines,
    this.maxLength,
    @required this.validator,
    @required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,),
      child: Container(
        height: boxHeight,
        decoration: BoxDecoration(
          color: Appearance.PRIMARY_LIGHT_COLOR,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: TextFormField(
          initialValue: initialValue,
          autofocus: autoFocus,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: Colors.white,
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            errorStyle: const TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black54,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w300,
              fontSize: 14,
              color: Colors.white,
            ),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
          maxLines: maxLines,
          maxLength: maxLength,
          validator: validator,
          onSaved: onSaved,
        ),
      ),
    );
  }
}
