import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/domain/entities/voter.dart';
import 'package:vote_observers/src/domain/repositories/voters_repository.dart';
import 'package:vote_observers/src/presenter/providers/global_providers.dart';

class GetVoters {
  final VotersRepository _votersRepository;
  const GetVoters(this._votersRepository);

  Stream<List<Voter>> getVoters({required String collectionName}) =>
      _votersRepository.getVoters(collectionName: collectionName);
}

final getVotersProvider = Provider<GetVoters>((ref) {
  return GetVoters(ref.read(votersRepositoryProvider));
});