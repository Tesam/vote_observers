import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/domain/repositories/auth_repository.dart';
import 'package:vote_observers/src/presenter/providers/global_providers.dart';

class SignInWithEmail {
  final AuthRepository _authRepository;
  const SignInWithEmail(this._authRepository);

  Future<User?> signIn({required String email, required String password}) =>
      _authRepository.signInWithEmail(email: email, password: password);
}

final signInProvider = Provider<SignInWithEmail>((ref) {
  return SignInWithEmail(ref.read(authRepositoryProvider));
});