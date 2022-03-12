import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_observers/domain/models/counter.dart';

class CountersTable {
  final CollectionReference countersRef = FirebaseFirestore.instance
      .collection("counters")
      .withConverter<Counter>(
    fromFirestore: (snapshot, _) => Counter.fromJson(snapshot.data()!),
    toFirestore: (operator, _) => operator.toJson(),
  );

  Future<void> incrementOperatorCounter() async {
    final shardRef = countersRef.doc("operators");
    await shardRef.update({'count': FieldValue.increment(1)});
  }

  Future<int> getOperatorCounter() async {
    final Counter counter =
    (await countersRef.doc("operators").get()).data()! as Counter;

    return counter.count;
  }
}