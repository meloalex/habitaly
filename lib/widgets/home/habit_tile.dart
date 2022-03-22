import 'package:Habitaly/models/habit.dart';
import 'package:Habitaly/utilities/appearence.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;
  final Function onTap;

  HabitTile({@required this.habit, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5.0,
              spreadRadius: 3.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Material(
          color: Appearance.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Appearance.PRIMARY_LIGHT_COLOR,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Icon(Appearance.categoryIcons[habit.category]),
                      ),
                      Text(
                        habit.title,
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            color: Appearance.PRIMARY_LIGHT_COLOR,
                            shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          habit.streakToEmoji(),
                          style: TextStyle(fontSize: 18),
                        )),
                      ),
                    ],
                  ),
                  LinearPercentIndicator(
                    width: 250,
                    lineHeight: 22.0,
                    percent: habit.calculateProgress(),
                    backgroundColor: Appearance.PRIMARY_LIGHT_COLOR,
                    progressColor: Appearance.categoryColors[habit.category],
                    animation: true,
                    alignment: MainAxisAlignment.center,
                    center: Text(
                      "${habit.calculatePercentage()}%",
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
class TileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    path.moveTo(3.0, 25.0);
    path.quadraticBezierTo(5.0, 15.0, 15.0, 15.0);

    path.lineTo(size.width - 25.0, 0.0);
    path.quadraticBezierTo(size.width - 5.0, 0.0, size.width - 5.0, 20.0);

    path.lineTo(size.width, size.height - 15.0);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 15.0, size.height);

    path.lineTo(15.0, size.height);
    path.quadraticBezierTo(0.0, size.height, 0.0, size.height - 10.0);

    path.close();

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}    */
