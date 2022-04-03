import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/data/counters_table.dart';
import 'package:vote_observers/data/operators_table.dart';
import 'package:vote_observers/data/partners_table.dart';
import 'package:vote_observers/domain/models/operator.dart';
import 'package:vote_observers/domain/models/partner.dart';

class OperatorsProvider with ChangeNotifier {
  int? operatorsCount;
  int? partnersAssignedCount;
  List<Operator> operatorList = [];
  Operator? currentOperator;

  List<Partner> assignedPartners = [];

  final OperatorsTable operatorsTable = OperatorsTable();
  final CountersTable countersTable = CountersTable();
  final PartnersTable partnersTable = PartnersTable();

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
    notifyListeners();
  }

  Future<void> setAssignedPartners({required List<dynamic> newAssignedPartners}) async {

    print("RECIBO $newAssignedPartners");
    assignedPartners = await partnersTable.getPartnersByIds(
        partnerIdentifications: newAssignedPartners);

    notifyListeners();
  }
}
