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

  Future<int> getCounter({required String docID}) async {
    final TableResults counter =
    (await tableResultsRef.doc(docID).get()).data()! as TableResults;

    return counter.count;
  }
}