import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_observers/domain/models/operator.dart';

class OperatorsTable {
  final CollectionReference operatorsRef = FirebaseFirestore.instance
      .collection("operators_21")
      .withConverter<Operator>(
        fromFirestore: (snapshot, _) => Operator.fromJson(snapshot.data()!),
        toFirestore: (operator, _) => operator.toJson(),
      );

  Future<bool> isOperatorExist(id) async {
    return await operatorsRef
        .doc(id)
        .get()
        .then((value) => (value.exists) ? true : false);
  }

  Future<Operator> getOperator({required String operatorID}) async {
    final Operator operator =
    (await operatorsRef.doc(operatorID).get()).data()! as Operator;

    return operator;
  }

  Future<List<Operator>> getOperators() async {
    final List<Operator> operators = (await operatorsRef.get())
        .docs
        .map((document) => document.data() as Operator)
        .toList();

    return operators;
  }

  Future<bool> createOperator(
      {required Operator operator, required String operatorID}) {
    return operatorsRef
        .doc(operatorID)
        .set(operator)
        .then((value) => true)
        .catchError((error) => print("Failed to add user: $error"));
  }
}
