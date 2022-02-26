import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_observers/domain/models/operators.dart';

class OperatorsFirebase {
  final CollectionReference operatorsRef = FirebaseFirestore.instance
      .collection("operators")
      .withConverter<Operator>(
        fromFirestore: (snapshot, _) => Operator.fromJson(snapshot.data()!),
        toFirestore: (operator, _) => operator.toJson(),
      );

  Future<List<Operator>> getOperators() async {

    final List<Operator> operators = (await operatorsRef.get())
        .docs
        .map((document) => document.data() as Operator)
        .toList();

    return operators;
  }
}
