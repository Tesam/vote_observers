import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/domain/repositories/auth_repository.dart';
import 'package:vote_observers/src/presenter/providers/global_providers.dart';

class SignOut {
  final AuthRepository _authRepository;
  const SignOut(this._authRepository);

  Future<void> signOut() =>
      _authRepository.signOut();
}

final signOutProvider = Provider<SignOut>((ref) {
  return SignOut(ref.read(authRepositoryProvider));
});