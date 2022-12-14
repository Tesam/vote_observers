import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vote_observers/on_refactor/data/counters_table.dart';
import 'package:vote_observers/on_refactor/data/counters_table_2.dart';
import 'package:vote_observers/on_refactor/presenter/candidates/candidates.dart';
import 'package:vote_observers/on_refactor/presenter/observers/table_list.dart';
import 'package:vote_observers/on_refactor/presenter/observers/tables_observers.dart';
import 'package:vote_observers/on_refactor/presenter/operators/operators_group.dart';
import 'package:vote_observers/on_refactor/presenter/partners/partner_consults.dart';
import 'package:vote_observers/src/my_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static CountersTable countersTable = CountersTable();
  static CountersTable2 countersTable2 = CountersTable2();

  late int partnersGeneralVotes;
  late int partnersAssignedVotes;
  late int partnersAssigned, partnersAssigned2, partnersAssignedTotal;
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

    partnersAssigned2 =
    await countersTable2.getCounter(docID: "partners_assigned");

    setState(() {
      _isLoading = false;
      partnersAssignedTotal = partnersAssigned + partnersAssigned2;
      partnersGeneralVotesPercent = partnersGeneralVotes * 100 / 4008;
      partnersAssignedVotesPercent =
          partnersAssignedVotes * 100 / partnersAssignedTotal;

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
          "MICOOP",
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
                                builder: (context) => const OperatorsGroup()),
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
                          Icons.search,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            /*MaterialPageRoute(
                                builder: (context) => const Partners()),*/
                            MaterialPageRoute(
                                builder: (context) => const PartnerConsults()),
                          );
                        },
                        title: const Text(
                          "Consultas",
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
            color: MyTheme.darkGreen,
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
                                              text: '/4008',
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
                                      percent:
                                          partnersGeneralVotesPercent / 100,
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
                                              text: '/$partnersAssignedTotal',
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
                                      percent:
                                          partnersAssignedVotesPercent / 100,
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
                              const Text("Ingresa para observar la cantidad de votantes en cada mesa"),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  child: const Text(
                                    "Ver Mesas",
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
                      InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Conteo",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text("Ingresa para observar el conteo de votos de los candidatos"),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    child: const Text(
                                      "Ver Conteo",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const Candidates()),
                                    ),
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 0, 20),
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                              const Candidates()),
                        ),
                      )
                    ],
                  ),
          )),
    );
  }
}
