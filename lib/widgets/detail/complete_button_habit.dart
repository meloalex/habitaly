import 'package:Habitaly/blocs/habits/bloc/habits_bloc.dart';
import 'package:Habitaly/models/habit.dart';
import 'package:Habitaly/utilities/appearence.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteButtonHabitDay extends StatefulWidget {
  final Habit habit;

  CompleteButtonHabitDay({@required this.habit});

  @override
  _CompleteButtonHabitDayState createState() => _CompleteButtonHabitDayState();
}

class _CompleteButtonHabitDayState extends State<CompleteButtonHabitDay> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.habit.checkIfCompletedToday()
          ? _completeAnimation()
          : _completeButton(),
    );
  }

  Widget _completeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: RaisedButton(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: _completeAction,
        padding: EdgeInsets.symmetric(vertical: 22.0, horizontal: 46.0),
        child: const Text(
          'COMPLETE',
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

  void _completeAction() {
    setState(() {
      widget.habit.completeToday();
      BlocProvider.of<HabitsBloc>(context).add(UpdateHabit(widget.habit));
    });
  }

  Widget _completeAnimation() {
    return Container(
      height: 150,
      width: 150,
      child: const FlareActor(
        'assets/animations/success_check.flr',
        fit: BoxFit.contain,
        animation: 'Idle',
      ),
    );
  }
}
