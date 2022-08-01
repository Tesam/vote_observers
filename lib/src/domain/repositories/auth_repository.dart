import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Stream<User?> get authStateChanges;

  Future<User?> signInWithEmail({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
