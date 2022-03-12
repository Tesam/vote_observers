import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_observers/domain/models/counter.dart';

class CountersTable {
  final CollectionReference countersRef = FirebaseFirestore.instance
      .collection("counters")
      .withConverter<Counter>(
    fromFirestore: (snapshot, _) => Counter.fromJson(snapshot.data()!),
    toFirestore: (operator, _) => operator.toJson(),
  );

  Future<void> incrementCounter({required String docID}) async {
    final shardRef = countersRef.doc(docID);
    await shardRef.update({'count': FieldValue.increment(1)});
  }

  Future<int> getCounter({required String docID}) async {
    final Counter counter =
    (await countersRef.doc(docID).get()).data()! as Counter;

    return counter.count;
  }
}