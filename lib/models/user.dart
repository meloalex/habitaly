class User {
  final String id;
  final String documentId;
  final String name;
  final int score;
  final int daysToComplete;

  User.fromFirestore(Map snapshot, String documentId)
      : this.documentId = documentId,
        this.name = snapshot['name'],
        this.score = snapshot['score'],
        this.id = snapshot['uid'],
        this.daysToComplete = snapshot['daysToComplete'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'score': score,   //TODO: verify if uid is lost in db
      'daysToComplete': daysToComplete,
    };
  }

  @override
  String toString() => 'User { name: $name, score: $score}';
}
