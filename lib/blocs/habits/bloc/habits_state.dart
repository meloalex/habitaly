part of 'habits_bloc.dart';

@immutable
abstract class HabitsState extends Equatable {
  const HabitsState();

  @override
  List<Object> get props => [];
}

class HabitsLoading extends HabitsState {}

class HabitsLoaded extends HabitsState {
  final List<Habit> habits;

  const HabitsLoaded([this.habits = const []]);

  @override
  List<Object> get props => [habits];

  @override
  String toString() => 'HabitsLoaded { habits: $habits }';
}

class HabitsNotLoaded extends HabitsState {}
