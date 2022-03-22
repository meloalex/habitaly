part of 'habits_bloc.dart';

@immutable
abstract class HabitsEvent extends Equatable {
  const HabitsEvent();

  @override
  List<Object> get props => [];
}

class LoadHabits extends HabitsEvent {}

class AddHabit extends HabitsEvent {
  final String title;
  final String description;
  final String category;

  const AddHabit({
    @required this.title,
    @required this.description,
    @required this.category,
  });

  @override
  List<Object> get props => [title, description, category];

  @override
  String toString() => 'AddHabit { title: $title }';
}

class UpdateHabit extends HabitsEvent {
  final Habit updatedHabit;

  const UpdateHabit(this.updatedHabit);

  @override
  List<Object> get props => [updatedHabit];

  @override
  String toString() => 'UpdateTodo { updatedTodo: $updatedHabit }';
}

class DeleteHabit extends HabitsEvent {
  final Habit habit;

  const DeleteHabit(this.habit);

  @override
  List<Object> get props => [habit];

  @override
  String toString() => 'DeleteTodo { todo: $habit }';
}

class HabitsUpdated extends HabitsEvent {
  final List<Habit> habits;

  const HabitsUpdated(this.habits);

  @override
  List<Object> get props => [habits];
}
