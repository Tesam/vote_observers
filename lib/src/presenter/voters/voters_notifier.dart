import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/domain/repositories/voters_repository.dart';

class VotersNotifier extends StateNotifier<Stream> {
  VotersNotifier(this._votersRepository) : super(const Stream.empty());
  final VotersRepository _votersRepository;

  Future<bool> addVote(
      {required String collectionName,
      required String documentId,
      }) async {
    try {
      return _votersRepository.addVote(
          collectionName: collectionName, documentId: documentId);
    } on FirebaseAuthException catch (_) {
      return false;
    }
  }

  getVoters({required String collectionName}){
    state = _votersRepository.getVoters(collectionName: collectionName);
  }
}

/*final votersProvider = StateNotifierProvider<VotersNotifier, Stream>((ref) {
  return VotersNotifier(ref.read(votersRepositoryProvider));
});*/

