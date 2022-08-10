import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/domain/entities/voting_user.dart';
import 'package:vote_observers/src/domain/repositories/auth_repository.dart';
import 'package:vote_observers/src/presenter/providers/global_providers.dart';

class GetUserById {
  GetUserById(this._authRepository);
  final AuthRepository _authRepository;

  Stream<VotingUser> getUserById(String uid) => _authRepository.getUserById(uid: uid);
}

final getUserByIdProvider = Provider<GetUserById>((ref) {
  return GetUserById(ref.read(authRepositoryProvider));
});