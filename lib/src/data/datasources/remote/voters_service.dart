import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/data/models/table_voter_model.dart';
import 'package:vote_observers/src/presenter/providers/global_providers.dart';

class VotersService {
  const VotersService(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;

  Future<bool> addVote({
    required String collectionName,
    required String documentId,
  }) {
    CollectionReference table = _firebaseFirestore.collection(collectionName);

    return table
        .doc(documentId)
        .set({"voted": true}, SetOptions(merge: true))
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<List<TableVoterModel>> getVoters({required String collectionName}) {
    return _firebaseFirestore
        .collection(collectionName)
        .orderBy("order")
        .withConverter<TableVoterModel>(fromFirestore: (snapshot, options) {
          return TableVoterModel.fromJson(snapshot.data()!);
        }, toFirestore: (value, options) {
          return value.toJson();
        })
        .snapshots()
        .map((query) => query.docs.map((snapshot) => snapshot.data()).toList());
  }
}

final votersServiceProvider = Provider<VotersService>((ref) {
  return VotersService(ref.read(firebaseFirestoreProvider));
});
