import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_observers/domain/models/counter.dart';

class CountersTable2 {
  final CollectionReference countersRef = FirebaseFirestore.instance
      .collection("counters_21_2")
      .withConverter<Counter>(
    fromFirestore: (snapshot, _) => Counter.fromJson(snapshot.data()!),
    toFirestore: (operator, _) => operator.toJson(),
  );

  Future<void> incrementCounter({required String docID, int incrementValue = 1}) async {
    final shardRef = countersRef.doc(docID);
    await shardRef.update({'count': FieldValue.increment(incrementValue)});
  }

  Future<void> decrementCounter({required String docID, int decrementValue = 1}) async {
    final shardRef = countersRef.doc(docID);
    await shardRef.update({'count': FieldValue.increment(-decrementValue)});
  }

  Future<int> getCounter({required String docID}) async {
    final Counter counter =
    (await countersRef.doc(docID).get()).data()! as Counter;

    return counter.count;
  }
}