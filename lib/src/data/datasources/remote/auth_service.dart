import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/data/models/voting_user_model.dart';
import 'package:vote_observers/src/presenter/providers/global_providers.dart';

class AuthService {
  const AuthService(this._firebaseAuth, this._firebaseFirestore);

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Stream<VotingUserModel> getUserById(String uid) {
    return _firebaseFirestore
        .collection("users")
        .withConverter<VotingUserModel>(fromFirestore: (snapshot, options) {
          return VotingUserModel.fromJson(snapshot.data()!);
        }, toFirestore: (value, options) {
          return value.toJson();
        })
        .doc(uid)
        .snapshots()
        .map((query) => query.data()!);
  }

  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
      ref.read(firebaseAuthProvider), ref.read(firebaseFirestoreProvider));
});
