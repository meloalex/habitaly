import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Habitaly/blocs/habits/bloc/habits_bloc.dart';
import 'package:Habitaly/models/habit.dart';
import 'package:Habitaly/utilities/appearence.dart';
import 'package:Habitaly/views/add_edit_screen.dart';
import 'package:Habitaly/widgets/home/appbar.dart';
import 'package:Habitaly/widgets/general/background.dart';
import 'package:Habitaly/widgets/home/habit_tile.dart';

import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Header(),
      ),
      body: CustomPaint(
        painter: BackgroundPainter(
          bigCircle: Appearance.BACKGROUND_CIRCLE_COLOR,
        ),
        child: BlocBuilder<HabitsBloc, HabitsState>(
          builder: (context, state) {
            if (state is HabitsLoading)
              return const Center(child: CircularProgressIndicator());

            if (state is HabitsLoaded) return _buildList(state.habits);

            if (state is HabitsNotLoaded)
              return const Center(child: Text('No habits created'));

            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Appearance.PRIMARY_COLOR,
        tooltip: 'Create Habit',
        onPressed: () => Navigator.of(context).push(
          AddEditHabitScreen.route(false),
        ),
      ),
    );
  }

  Widget _buildList(List<Habit> habits) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        return HabitTile(
          habit: habits[index],
          onTap: () => Navigator.of(context).push(DetailScreen.route(
            habits[index].creationTime,
          )),
        );
      },
    );
  }
}
