import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/on_refactor/data/counters_table_2.dart';
import 'package:vote_observers/on_refactor/data/operators_table_2.dart';
import 'package:vote_observers/on_refactor/data/partners_table.dart';
import 'package:vote_observers/on_refactor/domain/models/operator.dart';
import 'package:vote_observers/on_refactor/domain/models/partner.dart';

class OperatorsProvider2 with ChangeNotifier {
  int? operatorsCount;
  int? partnersAssignedCount;
  List<Operator> operatorList = [];
  Operator? currentOperator;

  List<Partner> assignedPartners = [];

  final OperatorsTable2 operatorsTable = OperatorsTable2();
  final CountersTable2 countersTable = CountersTable2();
  final PartnersTable partnersTable = PartnersTable();

  bool isLoading = false;

  OperatorsProvider2() {
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
    currentOperator = await operatorsTable.getOperator(operatorID: operatorIdentification);
    notifyListeners();
  }

  Future<void> setAssignedPartners({required List<dynamic> newAssignedPartners}) async {

    assignedPartners = await partnersTable.getPartnersByIds(
        partnerIdentifications: newAssignedPartners);

    notifyListeners();
  }
}

