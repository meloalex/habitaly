import 'package:Habitaly/blocs/habits/bloc/habits_bloc.dart';
import 'package:Habitaly/models/habit.dart';
import 'package:Habitaly/models/checkpoint.dart';
import 'package:Habitaly/widgets/general/back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_node/timeline_node.dart';

class HabitTimelineScreen extends StatelessWidget {
  final DateTime creationDate;
  final List<CheckPoint> _checkpoints = [];

  HabitTimelineScreen({@required this.creationDate});

  static Route<dynamic> route(DateTime creationDate) {
    return MaterialPageRoute(
      builder: (context) => HabitTimelineScreen(
        creationDate: creationDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: BackAppBar(),
        preferredSize: Size.fromHeight(70),
      ),
      body: BlocConsumer<HabitsBloc, HabitsState>(
        listener: (context, state) {
          print(state.toString());
          if (state is HabitsLoaded) {
            final habit = state.habits.firstWhere(
                (habit) => habit.creationTime == creationDate,
                orElse: () => null);

            // Generate checkpoints
            habit.checkPointsCompleted.forEach((completedCheckpoint) =>
                _checkpoints.add(new CheckPoint(completedCheckpoint, false)));
            habit.checkPointsMissed.forEach((missedCheckpoint) =>
                _checkpoints.add(new CheckPoint(missedCheckpoint, true)));

            _checkpoints.sort();
          }
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: _checkpoints.length,
            itemBuilder: (context, index) {
              return TimelineNode(
                indicator: SizedBox(
                  width: 10,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color:
                          _checkpoints[index].missed ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
                child: Text(_checkpoints[index].time.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
