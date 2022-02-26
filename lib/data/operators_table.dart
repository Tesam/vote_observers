import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_observers/domain/models/operator.dart';

class OperatorsTable {
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

  Future<bool> createOperator({required Operator operator, required String operatorID}) {

    return operatorsRef
        .doc(operatorID)
        .set(operator)
        .then((value) => true)
        .catchError((error) => print("Failed to add user: $error"));
  }
}
