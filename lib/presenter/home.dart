import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vote_observers/data/counters_table.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/observers/tables_observers.dart';
import 'package:vote_observers/presenter/operators/operatorsList/operators.dart';
import 'package:vote_observers/presenter/partners/partners.dart';
import 'package:vote_observers/presenter/observers/table_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static CountersTable countersTable = CountersTable();

  late int partnersGeneralVotes;
  late int partnersAssignedVotes;
  late int partnersAssigned;
  late double partnersGeneralVotesPercent;
  late double partnersAssignedVotesPercent;

  bool _isLoading = false;

  Future<void> getCounters() async {
    setState(() {
      _isLoading = true;
    });
    partnersGeneralVotes =
        await countersTable.getCounter(docID: "partners_general_votes");
    partnersAssignedVotes =
        await countersTable.getCounter(docID: "partners_assigned_votes");
    partnersAssigned =
    await countersTable.getCounter(docID: "partners_assigned");

    setState(() {
      _isLoading = false;
      partnersGeneralVotesPercent = partnersGeneralVotes * 100 / 16437;
      partnersAssignedVotesPercent = partnersAssignedVotes * 100 / partnersAssigned;
    });
  }

  @override
  void initState() {
    super.initState();
    getCounters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MIC",
          style: TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const Operators()),
                          );
                        },
                        title: const Text(
                          "Operadores",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(
                          Icons.people,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const Partners()),
                          );
                        },
                        title: const Text(
                          "Socios",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const TablesObservers()),
                          );
                        },
                        title: const Text(
                          "Veedores",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      value: 2,
                    ),
                  ]),
        ],
        elevation: 0,
        backgroundColor: MyTheme.background,
      ),
      backgroundColor: MyTheme.background,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: RefreshIndicator(
            color: MyTheme.primaryColor,
            onRefresh: () async => await getCounters(),
            child: (_isLoading)
                ? const Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.darkGreen,
                    ),
                  )
                : ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Votantes",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: '$partnersGeneralVotes ',
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                        children: const <TextSpan>[
                                          TextSpan(
                                              text: '/16437',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                              )),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "General",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: MyTheme.gray2Text,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    LinearPercentIndicator(
                                      width: 135,
                                      animation: true,
                                      lineHeight: 16.0,
                                      padding: EdgeInsets.zero,
                                      animationDuration: 1000,
                                      percent: partnersGeneralVotesPercent/100,
                                      center: Text(
                                        "${partnersGeneralVotesPercent.toStringAsFixed(2)}%",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      barRadius: const Radius.circular(5),
                                      progressColor: MyTheme.primaryColor,
                                      backgroundColor: const Color(0xFFC4C4C4),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: '$partnersAssignedVotes ',
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '/$partnersAssigned',
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                              )),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "Asignados",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: MyTheme.gray2Text,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    LinearPercentIndicator(
                                      width: 135,
                                      animation: true,
                                      lineHeight: 16.0,
                                      padding: EdgeInsets.zero,
                                      animationDuration: 1000,
                                      percent: partnersAssignedVotesPercent / 100,
                                      center: Text(
                                        "${partnersAssignedVotesPercent.toStringAsFixed(2)}%",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      barRadius: const Radius.circular(5),
                                      progressColor: MyTheme.primaryColor,
                                      backgroundColor: const Color(0xFFC4C4C4),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Mesas",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                "Con el menor porcentaje de votos asignados registrados. ",
                                style: TextStyle(
                                    color: MyTheme.gray2Text, fontSize: 14.0),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              GridView.count(
                                // Create a grid with 2 columns. If you change the scrollDirection to
                                // horizontal, this produces 2 rows.
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                // Generate 100 widgets that display their index in the List.
                                children: List.generate(9, (index) {
                                  return Center(
                                    child: Text(
                                      'Mesa $index',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  );
                                }),
                                childAspectRatio: 3,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  child: const Text(
                                    "Ver detalles",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TableList()),
                                  ),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 0, 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const TableList()),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Sucursales",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: MyTheme.gray4Text)),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "San Juan",
                                        style: TextStyle(
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          text: '400 ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '/15000',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                )),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Asignados",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      LinearPercentIndicator(
                                        width: 135,
                                        animation: true,
                                        lineHeight: 16.0,
                                        padding: EdgeInsets.zero,
                                        animationDuration: 1000,
                                        percent: 0.30,
                                        center: const Text(
                                          "2.7%",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        barRadius: const Radius.circular(5),
                                        progressColor: MyTheme.primaryColor,
                                        backgroundColor:
                                            const Color(0xFFC4C4C4),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: MyTheme.gray4Text)),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "San Ignacio",
                                        style: TextStyle(
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          text: '400 ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '/15000',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                )),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Asignados",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      LinearPercentIndicator(
                                        width: 135,
                                        animation: true,
                                        lineHeight: 16.0,
                                        padding: EdgeInsets.zero,
                                        animationDuration: 1000,
                                        percent: 0.45,
                                        center: const Text(
                                          "2.7%",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        barRadius: const Radius.circular(5),
                                        progressColor: MyTheme.primaryColor,
                                        backgroundColor:
                                            const Color(0xFFC4C4C4),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: MyTheme.gray4Text)),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "San Juan",
                                        style: TextStyle(
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          text: '400 ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '/15000',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                )),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Asignados",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      LinearPercentIndicator(
                                        width: 135,
                                        animation: true,
                                        lineHeight: 16.0,
                                        padding: EdgeInsets.zero,
                                        animationDuration: 1000,
                                        percent: 0.6,
                                        center: const Text(
                                          "2.7%",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        barRadius: const Radius.circular(5),
                                        progressColor: MyTheme.primaryColor,
                                        backgroundColor:
                                            const Color(0xFFC4C4C4),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: MyTheme.gray4Text)),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "San Ignacio",
                                        style: TextStyle(
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          text: '400 ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '/15000',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                )),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Asignados",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      LinearPercentIndicator(
                                        width: 135,
                                        animation: true,
                                        lineHeight: 16.0,
                                        padding: EdgeInsets.zero,
                                        animationDuration: 1000,
                                        percent: 0.9,
                                        center: const Text(
                                          "2.7%",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        barRadius: const Radius.circular(5),
                                        progressColor: MyTheme.primaryColor,
                                        backgroundColor:
                                            const Color(0xFFC4C4C4),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: MyTheme.gray4Text)),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "San Juan",
                                        style: TextStyle(
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          text: '400 ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '/15000',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                )),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Asignados",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      LinearPercentIndicator(
                                        width: 135,
                                        animation: true,
                                        lineHeight: 16.0,
                                        padding: EdgeInsets.zero,
                                        animationDuration: 1000,
                                        percent: 0.5,
                                        center: const Text(
                                          "2.7%",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        barRadius: const Radius.circular(5),
                                        progressColor: MyTheme.primaryColor,
                                        backgroundColor:
                                            const Color(0xFFC4C4C4),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: MyTheme.gray4Text)),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "San Ignacio",
                                        style: TextStyle(
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      RichText(
                                        text: const TextSpan(
                                          text: '400 ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '/15000',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                )),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        "Asignados",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: MyTheme.gray2Text,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      LinearPercentIndicator(
                                        width: 135,
                                        animation: true,
                                        lineHeight: 16.0,
                                        padding: EdgeInsets.zero,
                                        animationDuration: 1000,
                                        percent: 0.6,
                                        center: const Text(
                                          "2.7%",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        barRadius: const Radius.circular(5),
                                        progressColor: MyTheme.primaryColor,
                                        backgroundColor:
                                            const Color(0xFFC4C4C4),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          )),
    );
  }
}
