import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:Habitaly/models/habit.dart';

class HabitsRepository {
  final CollectionReference _habitsSubCollection =
      Firestore.instance.collection('habits');

  Future<void> addNewHabit(Habit habit) {
    return _habitsSubCollection.add(habit.toJson());
  }

  Future<void> deleteHabit(Habit habit) {
    return _habitsSubCollection.document(habit.documentId).delete();
  }

  Stream<List<Habit>> habits(String userID) {
    return _habitsSubCollection
        .where('user', isEqualTo: userID)
        .snapshots()
        .map((snapshot) {
      return snapshot.documents
          .map((doc) => Habit.fromFirestore(doc.data, doc.documentID))
          .toList();
    });
  }

  Future<void> updateHabit(Habit habit) {
    return _habitsSubCollection
        .document(habit.documentId)
        .updateData(habit.toJson());
  }
}
