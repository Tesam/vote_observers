import 'package:firebase_auth/firebase_auth.dart';
import 'package:vote_observers/src/domain/entities/voting_user.dart';

abstract class AuthRepository {
  Stream<User?> get authStateChanges;

  Future<User?> signInWithEmail({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Stream<VotingUser> getUserById({
    required String uid,
  });
}
