import 'package:firebase_auth/firebase_auth.dart';
import 'package:vote_observers/src/domain/repositories/auth_repository.dart';

class AuthRepositoryIml implements AuthRepository {
  const AuthRepositoryIml(this._auth);

  final FirebaseAuth _auth;

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
