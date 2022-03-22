import 'package:Habitaly/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 42.0, left: 22.0, right: 32.0),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.person),
                        iconSize: 42.0,
                        onPressed: () {},
                        color: Colors.black87,
                      ),
                      Text(
                        state.user.name,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          color: Color(0xff5049a3),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${state.user.score}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 20,
                            color: Color(0xff5049a3),
                          ),
                        ),
                        const Text(
                          "score",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 12,
                            color: Color(0xff5049a3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
