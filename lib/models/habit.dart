import 'package:Habitaly/utilities/appearence.dart';
import 'package:Habitaly/utilities/range.dart';
import 'package:flutter/material.dart';

class Habit {
  String userID;
  String documentId;
  String title;
  String description;
  String category;
  DateTime creationTime; // Habit creation day
  List<DateTime> checkPointsCompleted; // All days that habit has been completed
  List<DateTime> checkPointsMissed; // All days that habit has been skipped
  int daysCompleted; // Only valid days
  int streakDays; // Days without missing; can be positive or negative

  static final int daysToComplete =
      28; // TODO: Move this to account configuration

  Habit({
    @required this.userID,
    this.documentId,
    @required this.title,
    this.description = '',
    @required this.category,
    @required this.creationTime,
    this.checkPointsCompleted = const [], // Default values
    this.checkPointsMissed = const [],
    this.daysCompleted = 0,
    this.streakDays = 0,
  });

  Habit.fromFirestore(Map snapshot, String documentId) {
    this.userID = snapshot['user'];
    this.documentId = documentId;
    this.title = snapshot['title'];
    this.description = snapshot['description'] ?? '';
    this.category = snapshot['category'];
    this.creationTime = snapshot['creationTime'].toDate();
    this.checkPointsCompleted =
        generateCheckpoints(snapshot['checkPointsCompleted']) ?? [];
    this.checkPointsMissed =
        generateCheckpoints(snapshot['checkPointsMissed']) ?? [];
    this.daysCompleted = snapshot['daysCompleted'] ?? 0;
    this.streakDays = snapshot['streakDaysCompleted'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'user': userID,
      'title': title,
      'description': description,
      'category': category,
      'creationTime': creationTime,
      'checkPointsCompleted': checkPointsCompleted,
      'checkPointsMissed': checkPointsMissed,
      'daysCompleted': daysCompleted,
      'streakDaysCompleted': streakDays,
    };
  }

  static List<DateTime> generateCheckpoints(List<dynamic> rawCheckPoints) {
    List<DateTime> checkpoints = [];
    rawCheckPoints.forEach((element) => checkpoints.add(element.toDate()));
    return checkpoints;
  }

  @override
  String toString() {
    return 'Habit { title: $title, creationTime: $creationTime }';
  }

  double calculateProgress() {
    return daysCompleted / daysToComplete;
  }

  String calculatePercentage() {
    return ((daysCompleted / daysToComplete) * 100).toStringAsFixed(0);
  }

  bool checkIfCompletedToday() {
    DateTime today = DateTime.now();
    for (DateTime checkpoint in checkPointsCompleted) {
      int diffDays = today.difference(checkpoint).inDays;

      if (diffDays == 0 && today.day == checkpoint.day) {
        return true;
      }
    }
    return false;
  }

  void completeToday() {
    DateTime timestamp = DateTime.now();
    streakDays++;
    daysCompleted++;
    checkPointsCompleted.add(timestamp);
  }

  String streakToEmoji() {
    for (MapEntry<Range, String> entry in Appearance.streakEmojis.entries) {
      if (entry.key.isInRange(streakDays)) return entry.value;
    }

    return '';
  }
}
