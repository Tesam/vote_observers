import 'package:firebase_auth/firebase_auth.dart';
import 'package:vote_observers/src/data/datasources/remote/auth_service.dart';
import 'package:vote_observers/src/domain/entities/voting_user.dart';
import 'package:vote_observers/src/domain/repositories/auth_repository.dart';

class AuthRepositoryIml implements AuthRepository {
  const AuthRepositoryIml(this._authService);

  final AuthService _authService;

  @override
  Stream<User?> get authStateChanges => _authService.authStateChanges;

  @override
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _authService.signInWithEmail(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
  }

  @override
  Stream<VotingUser> getUserById({required String uid}) => _authService.getUserById(uid);
}
