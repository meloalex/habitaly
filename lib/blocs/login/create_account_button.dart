import 'package:Habitaly/utilities/appearence.dart';
import 'package:flutter/material.dart';

import 'package:Habitaly/repos/user_repository.dart';
import 'package:Habitaly/blocs/register/register_screen.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, right: 42.0, left: 42.0),
      child: RaisedButton(
        color: Appearance.PINK,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return RegisterScreen(userRepository: _userRepository);
            }),
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Create an Account",
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
