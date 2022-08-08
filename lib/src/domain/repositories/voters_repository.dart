import 'package:vote_observers/src/domain/entities/voter.dart';

abstract class VotersRepository {
  Future<bool> addVote({
    required String collectionName,
    required String documentId,
  });

  Stream<List<Voter>> getVoters({required String collectionName});
}
