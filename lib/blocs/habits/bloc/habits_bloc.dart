import 'dart:async';

import 'package:Habitaly/repos/habits_repository.dart';
import 'package:Habitaly/models/habit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'habits_event.dart';
part 'habits_state.dart';

class HabitsBloc extends Bloc<HabitsEvent, HabitsState> {
  final HabitsRepository _habitsRepository;
  StreamSubscription _habitsSubscription;
  String userID = '';

  HabitsBloc({@required HabitsRepository habitsRepository, this.userID})
      : assert(habitsRepository != null),
        _habitsRepository = habitsRepository;

  @override
  HabitsState get initialState => HabitsLoading();

  @override
  Stream<HabitsState> mapEventToState(HabitsEvent event) async* {
    if (event is LoadHabits)
      yield* _mapLoadHabitsToState();
    else if (event is AddHabit)
      yield* _mapAddHabitToState(event);
    else if (event is UpdateHabit)
      yield* _mapUpdateHabitToState(event);
    else if (event is DeleteHabit)
      yield* _mapDeleteHabitToState(event);
    else if (event is HabitsUpdated) yield* _mapHabitsUpdateToState(event);
  }

  Stream<HabitsState> _mapLoadHabitsToState() async* {
    _habitsSubscription?.cancel();
    _habitsSubscription = _habitsRepository.habits(userID).listen(
          (habits) => add(HabitsUpdated(habits)),
        );
  }

  Stream<HabitsState> _mapAddHabitToState(AddHabit event) async* {
    Habit newHabit = new Habit(
      userID: userID,
      title: event.title,
      description: event.description,
      category: event.category,
      creationTime: DateTime.now(),
    );
    _habitsRepository.addNewHabit(newHabit);
  }

  Stream<HabitsState> _mapUpdateHabitToState(UpdateHabit event) async* {
    _habitsRepository.updateHabit(event.updatedHabit);
  }

  Stream<HabitsState> _mapDeleteHabitToState(DeleteHabit event) async* {
    _habitsRepository.deleteHabit(event.habit);
  }

  Stream<HabitsState> _mapHabitsUpdateToState(HabitsUpdated event) async* {
    yield HabitsLoaded(event.habits);
  }

  @override
  Future<void> close() {
    _habitsSubscription?.cancel();
    return super.close();
  }
}
