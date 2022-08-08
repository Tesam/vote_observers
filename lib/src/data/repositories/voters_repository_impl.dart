import 'package:vote_observers/src/data/datasources/remote/voters_service.dart';
import 'package:vote_observers/src/domain/repositories/voters_repository.dart';

class VotersRepositoryImpl implements VotersRepository {
  const VotersRepositoryImpl(this._votersService);
  final VotersService _votersService;

  @override
  Future<bool> addVote({required String collectionName, required String documentId}) {
    return _votersService.addVote(collectionName: collectionName, documentId: documentId);
  }

  @override
  Stream getVoters({required String collectionName}) {
    return _votersService.getVoters(collectionName: collectionName);
  }

}