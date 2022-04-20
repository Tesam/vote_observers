import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/operators/operatorsList/operators.dart';
//import 'package:vote_observers/presenter/operators/operatorsList/operators_2.dart';
import 'package:vote_observers/presenter/operators/operatorsList/operators_provider.dart';
import 'package:vote_observers/presenter/operators/operatorsList/operators_provider_2.dart';

class OperatorsGroup extends StatefulWidget {
  const OperatorsGroup({Key? key}) : super(key: key);

  @override
  _OperatorsGroupState createState() => _OperatorsGroupState();
}

class _OperatorsGroupState extends State<OperatorsGroup> {
  static OperatorsProvider2 operatorsProvider2 = OperatorsProvider2();
  static OperatorsProvider operatorsProvider = OperatorsProvider();

  int operatorsCount = 0, partnersAssignedCount = 0;

  @override
  void initState() {
    super.initState();
    getCounters();
  }

  getCounters() async {
    await operatorsProvider2.getOperatorsCount();
    await operatorsProvider2.getPartnersAssignedCount();

    await operatorsProvider.getOperatorsCount();
    await operatorsProvider.getPartnersAssignedCount();

    setState(() {
      operatorsCount = operatorsProvider.operatorsCount! + operatorsProvider2.operatorsCount!;
      partnersAssignedCount = operatorsProvider.partnersAssignedCount! + operatorsProvider2.partnersAssignedCount!;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Operadores",
            style: TextStyle(color: MyTheme.gray2Text),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: MyTheme.background,
        ),
        body: RefreshIndicator(
          onRefresh: () => getCounters(),
          color: MyTheme.darkGreen,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyTheme.primary100),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "$operatorsCount Operadores creados",
                        //"ds",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: MyTheme.darkGreen,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyTheme.lightYellow),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "$partnersAssignedCount Socios asignados",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: MyTheme.darkYellow,
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), color: Colors.white),
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 130,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "MICOOP Fernando",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Operators()));
                  },
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), color: Colors.white),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 130,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "MICOOP Clara",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  onTap: () {
                  /*  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Operators2()));*/
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}

