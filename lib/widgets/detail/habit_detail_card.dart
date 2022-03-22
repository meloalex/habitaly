import 'package:Habitaly/models/habit.dart';
import 'package:Habitaly/utilities/appearence.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HabitDetailCard extends StatelessWidget {
  final Habit habit;

  HabitDetailCard({@required this.habit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Container(
        height: 450,
        decoration: BoxDecoration(
          color: Appearance.PRIMARY_COLOR,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2,),
              Text(
                habit.title,
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const Spacer(flex: 3,),
              Text(
                "Description",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const Spacer(flex: 2,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  habit.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(flex: 3,),
              Text(
                "Category",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const Spacer(flex: 2,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Appearance.PRIMARY_LIGHT_COLOR,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Appearance.categoryIcons[habit.category],
                        color: Colors.black54,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      habit.category,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 3,),
              Text(
                "Progress",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const Spacer(flex: 2,),
              Center(
                child: Text(
                  "${habit.calculatePercentage()}%",
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(flex: 1,),
              LinearPercentIndicator(
                width: 250.0,
                lineHeight: 25.0,
                percent: habit.calculateProgress(),
                backgroundColor: Appearance.PRIMARY_LIGHT_COLOR,
                progressColor: Appearance.categoryColors[habit.category],
                animation: true,
                alignment: MainAxisAlignment.center,
              ),
              const Spacer(flex: 1,),
              Center(
                child: Text(
                  "${habit.streakDays} days without missing",
                  style: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}
