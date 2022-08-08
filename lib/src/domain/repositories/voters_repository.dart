abstract class VotersRepository {
  Future<bool> addVote({
    required String collectionName,
    required String documentId,
  });

  Stream getVoters({required String collectionName});
}
