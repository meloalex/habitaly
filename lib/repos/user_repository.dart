import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Habitaly/models/user.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({String name, String email, String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    FirebaseUser firebaseUser = await _firebaseAuth.currentUser();

    Map<String, dynamic> data = {
      'name': name,
      'score': 0,
      'uid': firebaseUser.uid,
      'email': firebaseUser.email,
    };

    await Firestore.instance.collection('users').add(data);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<User> getUser() async {
    String uid = (await _firebaseAuth.currentUser()).uid;

    QuerySnapshot result = await Firestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .getDocuments();

    return User.fromFirestore(
        result.documents[0].data, result.documents[0].documentID);
  }
}
