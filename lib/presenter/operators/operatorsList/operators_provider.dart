import 'package:flutter/foundation.dart';
import 'package:vote_observers/data/counters_table.dart';
import 'package:vote_observers/data/operators_table.dart';

class OperatorsProvider with ChangeNotifier {
  int? operatorsCount;
  int? partnersAssignedCount;

  final OperatorsTable operatorsTable = OperatorsTable();
  final CountersTable countersTable = CountersTable();

  Future<void> getOperatorsCount() async {
    operatorsCount = await countersTable.getCounter(docID: "operators");
    notifyListeners();

  }

  Future<void> getPartnersAssignedCount() async {
    partnersAssignedCount =
    await countersTable.getCounter(docID: "partners_assigned");
    notifyListeners();
  }
}