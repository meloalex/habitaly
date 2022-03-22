import 'package:flutter/material.dart';
import 'package:Habitaly/utilities/appearence.dart';

class SubmitFormButton extends StatelessWidget {
  final VoidCallback callback;
  final double vertialPaddingPercent;
  final String text;

  SubmitFormButton(
      {@required this.callback,
      @required this.vertialPaddingPercent,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: callback,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 42.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        color: Appearance.BLUE,
      ),
    );
  }
}
