import 'package:Habitaly/utilities/appearence.dart';
import 'package:flutter/material.dart';

class BackAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 34.0, left: 12.0),
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 32.0,
          color: Appearance.PRIMARY_COLOR,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
