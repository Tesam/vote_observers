import 'package:cloud_firestore/cloud_firestore.dart';

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

  Stream getVoters({required String collectionName}) {
    return _firebaseFirestore
        .collection(collectionName)
        .orderBy("order")
        .snapshots();
  }
}
