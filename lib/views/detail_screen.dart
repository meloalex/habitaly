import 'package:Habitaly/views/timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Habitaly/blocs/habits/bloc/habits_bloc.dart';
import 'package:Habitaly/widgets/general/back_appbar.dart';
import 'package:Habitaly/widgets/general/background.dart';
import 'package:Habitaly/widgets/detail/complete_button_habit.dart';
import 'package:Habitaly/widgets/detail/habit_detail_card.dart';
import 'package:Habitaly/utilities/appearence.dart';

class DetailScreen extends StatelessWidget {
  final DateTime creationDate;

  DetailScreen({@required this.creationDate});

  static Route<dynamic> route(DateTime creationDate) {
    return MaterialPageRoute(
      builder: (context) => DetailScreen(
        creationDate: creationDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: BackAppBar(),
        preferredSize: Size.fromHeight(70.0),
      ),
      body: CustomPaint(
        painter: BackgroundPainter(
          bigCircle: Appearance.BACKGROUND_CIRCLE_COLOR,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: BlocBuilder<HabitsBloc, HabitsState>(
              builder: (context, state) {
                if (state is HabitsLoaded) {
                  final habit = state.habits.firstWhere(
                      (habit) => habit.creationTime == creationDate,
                      orElse: () => null);

                  return ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      HabitDetailCard(habit: habit),
                      CompleteButtonHabitDay(habit: habit),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.history),
        onPressed: () {
          BlocProvider.of<HabitsBloc>(context).add(LoadHabits());
          Navigator.of(context).push(HabitTimelineScreen.route(creationDate));
        } ,
      ),
    );
  }
}
