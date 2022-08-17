import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/on_refactor/presenter/observers/table_data.dart';
import 'package:vote_observers/src/my_theme.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  _TableListState createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  bool _isLoading = false;
  Map<String, int> tablesCounter = {};

  @override
  void initState() {
    super.initState();
    getCounters();
  }

  Future<void> getCounters() async {
    setState(() {
      _isLoading = true;
    });

    for (int i = 0; i < 12; i++) {
      CollectionReference tableRef =
          FirebaseFirestore.instance.collection("table_${i + 1}_21");

      int tableCounter =
          (await tableRef.where("state", isEqualTo: true).get()).docs.length;
      setState(() {
        tablesCounter["Mesa ${i + 1}"] = tableCounter;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Mesas",
            style: TextStyle(color: MyTheme.gray2Text),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: MyTheme.background,
        ),
        backgroundColor: MyTheme.background,
        body: RefreshIndicator(
          color: MyTheme.darkGreen,
          onRefresh: () => getCounters(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: (_isLoading)
                ? const Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.darkGreen,
                    ),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        child: ListView(
                          children: List.generate(
                            tablesCounter.length,
                            (index) => tableContainer(
                              tableNumber: "${index + 1}",
                              voters:
                                  "${tablesCounter["Mesa ${index + 1}"]}",
                              partners: "344",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ));
  }

  Widget tableContainer(
      {required String tableNumber,
      required String voters,
      required String partners}) {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mesa $tableNumber",
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: voters,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '/$partners socios',
                            style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: MyTheme.gray2Text)),
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TableData(tableNumber: tableNumber),
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                ),
              )
            ],
          )),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TableData(tableNumber: tableNumber),
        ),
      ),
    );
  }
}
