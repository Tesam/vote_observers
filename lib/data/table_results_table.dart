import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_observers/domain/models/table_results.dart';

class TableResultsTable {
  final CollectionReference tableResultsRef = FirebaseFirestore.instance
      .collection("table_results")
      .withConverter<TableResults>(
    fromFirestore: (snapshot, _) => TableResults.fromJson(snapshot.data()!),
    toFirestore: (operator, _) => operator.toJson(),
  );

  Future<bool> incrementCounter({required String docID, int incrementValue = 1}) async {
    final shardRef = tableResultsRef.doc(docID);
    await shardRef.update({'count': FieldValue.increment(incrementValue)}).onError((error, stackTrace) => false);
    return true;
  }

  Future<bool> decrementCounter({required String docID, int decrementValue = 1}) async {
    final shardRef = tableResultsRef.doc(docID);
    await shardRef.update({'count': FieldValue.increment(-decrementValue)}).onError((error, stackTrace) => false);
    return true;
  }

  Future<int> getCounter({required String docID}) async {
    final TableResults counter =
    (await tableResultsRef.doc(docID).get()).data()! as TableResults;

    return counter.count;
  }

  /*int c = 0;
  Future<void> addCandidatos() async {
    for (int i = 3; i < 34; i++) {
      tableResultsRef
          .doc("table${i}_tribunal5")
          .set(TableResults(count: 0))
          .then((values) async {
        c++;
        print("FIREBASE ADDED table${i}_tribunal5 id = $c");

        await Future.delayed(Duration(seconds: 10));
      }).catchError((error) => print("Failed to add candidato: $error"));
    }

  }*/
}