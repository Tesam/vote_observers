import 'package:flutter/foundation.dart';
import 'package:vote_observers/data/counters_table.dart';
import 'package:vote_observers/data/operators_table.dart';
import 'package:vote_observers/domain/models/operator.dart';

class OperatorsProvider with ChangeNotifier {
  int? operatorsCount;
  int? partnersAssignedCount;
  List<Operator> operatorList = [];
  Operator? currentOperator;

  final OperatorsTable operatorsTable = OperatorsTable();
  final CountersTable countersTable = CountersTable();

  bool isLoading = false;

  OperatorsProvider() {
    initializeOperatorsData();
  }

  Future<void> initializeOperatorsData() async {
    isLoading = true;
    await getOperators();
    await getOperatorsCount();
    await getPartnersAssignedCount();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getOperatorsCount() async {
    operatorsCount = await countersTable.getCounter(docID: "operators");
  }

  Future<void> getPartnersAssignedCount() async {
    partnersAssignedCount =
        await countersTable.getCounter(docID: "partners_assigned");
  }

  Future<void> getOperators() async {
    operatorList = await operatorsTable.getOperators();
  }

  Future<void> setCurrentOperator(
      {required String operatorIdentification}) async {
    currentOperator =
        await operatorsTable.getOperator(operatorID: operatorIdentification);
  }

}
