import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/domain/repositories/auth_repository.dart';
import 'package:vote_observers/src/presenter/providers/global_providers.dart';

class GetAuthState {
  final AuthRepository _authRepository;
  const GetAuthState(this._authRepository);

  Stream<User?> getAuthState() =>
      _authRepository.authStateChanges;
}

final getAuthStateProvider = Provider<GetAuthState>((ref) {
  return GetAuthState(ref.read(authRepositoryProvider));
});