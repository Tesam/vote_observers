import 'package:flutter/material.dart';
import 'package:vote_observers/data/table_results_table.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class CandidatesTables extends StatefulWidget {
  final String candidateName;
  final int candidate;
  final String place;

  const CandidatesTables(
      {Key? key,
      required this.candidateName,
      required this.candidate,
      required this.place})
      : super(key: key);

  @override
  _CandidatesTablesState createState() => _CandidatesTablesState();
}

class _CandidatesTablesState extends State<CandidatesTables> {
  TableResultsTable tableResultsTable = TableResultsTable();
  late int table1Count;
  late int table2Count;
  late int table3Count;
  late int table4Count;
  late int table5Count;
  late int table6Count;
  late int table7Count;
  late int table8Count;
  late int table9Count;
  late int table10Count;
  late int table11Count;
  late int table12Count;
  /*late int table13Count;
  late int table14Count;
  late int table15Count;
  late int table16Count;
  late int table17Count;
  late int table18Count;
  late int table19Count;
  late int table20Count;
  late int table21Count;
  late int table22Count;
  late int table23Count;
  late int table24Count;
  late int table25Count;
  late int table26Count;
  late int table27Count;
  late int table28Count;
  late int table29Count;
  late int table30Count;*/

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getVoteCounters();
  }

  void getVoteCounters() async {
    setState(() {
      _isLoading = true;
    });
    int table1 = await tableResultsTable.getCounter(docID: "table1_${widget.place}${widget.candidate}");
    int table2 = await tableResultsTable.getCounter(docID: "table2_${widget.place}${widget.candidate}");
    int table3 = await tableResultsTable.getCounter(docID: "table3_${widget.place}${widget.candidate}");
    int table4 = await tableResultsTable.getCounter(docID: "table4_${widget.place}${widget.candidate}");
    int table5 = await tableResultsTable.getCounter(docID: "table5_${widget.place}${widget.candidate}");
    int table6 = await tableResultsTable.getCounter(docID: "table6_${widget.place}${widget.candidate}");
    int table7 = await tableResultsTable.getCounter(docID: "table7_${widget.place}${widget.candidate}");
    int table8 = await tableResultsTable.getCounter(docID: "table8_${widget.place}${widget.candidate}");
    int table9 = await tableResultsTable.getCounter(docID: "table9_${widget.place}${widget.candidate}");
    int table10 = await tableResultsTable.getCounter(docID: "table10_${widget.place}${widget.candidate}");
    int table11 = await tableResultsTable.getCounter(docID: "table11_${widget.place}${widget.candidate}");
    int table12 = await tableResultsTable.getCounter(docID: "table12_${widget.place}${widget.candidate}");
    /*int table13 = await tableResultsTable.getCounter(docID: "table13_${widget.place}${widget.candidate}");
    int table14 = await tableResultsTable.getCounter(docID: "table14_${widget.place}${widget.candidate}");
    int table15 = await tableResultsTable.getCounter(docID: "table15_${widget.place}${widget.candidate}");
    int table16 = await tableResultsTable.getCounter(docID: "table16_${widget.place}${widget.candidate}");
    int table17 = await tableResultsTable.getCounter(docID: "table17_${widget.place}${widget.candidate}");
    int table18 = await tableResultsTable.getCounter(docID: "table18_${widget.place}${widget.candidate}");
    int table19 = await tableResultsTable.getCounter(docID: "table19_${widget.place}${widget.candidate}");
    int table20 = await tableResultsTable.getCounter(docID: "table20_${widget.place}${widget.candidate}");
    int table21 = await tableResultsTable.getCounter(docID: "table21_${widget.place}${widget.candidate}");
    int table22 = await tableResultsTable.getCounter(docID: "table22_${widget.place}${widget.candidate}");
    int table23 = await tableResultsTable.getCounter(docID: "table23_${widget.place}${widget.candidate}");
    int table24 = await tableResultsTable.getCounter(docID: "table24_${widget.place}${widget.candidate}");
    int table25 = await tableResultsTable.getCounter(docID: "table25_${widget.place}${widget.candidate}");
    int table26 = await tableResultsTable.getCounter(docID: "table26_${widget.place}${widget.candidate}");
    int table27 = await tableResultsTable.getCounter(docID: "table27_${widget.place}${widget.candidate}");
    int table28 = await tableResultsTable.getCounter(docID: "table28_${widget.place}${widget.candidate}");
    int table29 = await tableResultsTable.getCounter(docID: "table29_${widget.place}${widget.candidate}");
    int table30 = await tableResultsTable.getCounter(docID: "table30_${widget.place}${widget.candidate}");*/

    setState(() {
      table1Count = table1;
      table2Count = table2;
      table3Count = table3;
      table4Count = table4;
      table5Count = table5;
      table6Count = table6;
      table7Count = table7;
      table8Count = table8;
      table9Count = table9;
      table10Count = table10;
      table11Count = table11;
      table12Count = table12;
      /*table13Count = table13;
      table14Count = table14;
      table15Count = table15;
      table16Count = table16;
      table17Count = table17;
      table18Count = table18;
      table19Count = table19;
      table20Count = table20;
      table21Count = table21;
      table22Count = table22;
      table23Count = table23;
      table24Count = table24;
      table25Count = table25;
      table26Count = table26;
      table27Count = table27;
      table28Count = table28;
      table29Count = table29;
      table30Count = table30;*/

      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.candidateName,
          style: const TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyTheme.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: MyTheme.background,
      body: RefreshIndicator(
        onRefresh: () async => getVoteCounters(),
        color: MyTheme.darkGreen,
        child: (_isLoading)
            ? const Center(
          child: CircularProgressIndicator(
            color: MyTheme.darkGreen,
          ),
        )
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            children: [
              tableCounterContainer(
                  tableNumber: 1,
                  votes: table1Count),
              tableCounterContainer(
                  tableNumber: 2,
                  votes: table2Count),
              tableCounterContainer(
                  tableNumber: 3,
                  votes: table3Count),
              tableCounterContainer(
                  tableNumber: 4,
                  votes: table4Count),
              tableCounterContainer(
                  tableNumber: 5,
                  votes: table5Count),
              tableCounterContainer(
                  tableNumber: 6,
                  votes: table6Count),
              tableCounterContainer(
                  tableNumber: 7,
                  votes: table7Count),
              tableCounterContainer(
                  tableNumber: 8,
                  votes: table8Count),
              tableCounterContainer(
                  tableNumber: 9,
                  votes: table9Count),
              tableCounterContainer(
                  tableNumber: 10,
                  votes: table10Count),
              tableCounterContainer(
                  tableNumber: 11,
                  votes: table11Count),
              tableCounterContainer(
                  tableNumber: 12,
                  votes: table12Count),
              /*tableCounterContainer(
                  tableNumber: 13,
                  votes: table13Count),
              tableCounterContainer(
                  tableNumber: 14,
                  votes: table14Count),
              tableCounterContainer(
                  tableNumber: 15,
                  votes: table15Count),
              tableCounterContainer(
                  tableNumber: 16,
                  votes: table16Count),
              tableCounterContainer(
                  tableNumber: 17,
                  votes: table17Count),
              tableCounterContainer(
                  tableNumber: 18,
                  votes: table18Count),
              tableCounterContainer(
                  tableNumber: 19,
                  votes: table19Count),
              tableCounterContainer(
                  tableNumber: 20,
                  votes: table20Count),
              tableCounterContainer(
                  tableNumber: 21,
                  votes: table21Count),
              tableCounterContainer(
                  tableNumber: 22,
                  votes: table22Count),
              tableCounterContainer(
                  tableNumber: 23,
                  votes: table23Count),
              tableCounterContainer(
                  tableNumber: 24,
                  votes: table24Count),
              tableCounterContainer(
                  tableNumber: 25,
                  votes: table25Count),
              tableCounterContainer(
                  tableNumber: 26,
                  votes: table26Count),
              tableCounterContainer(
                  tableNumber: 27,
                  votes: table27Count),
              tableCounterContainer(
                  tableNumber: 28,
                  votes: table28Count),
              tableCounterContainer(
                  tableNumber: 29,
                  votes: table29Count),
              tableCounterContainer(
                  tableNumber: 30,
                  votes: table30Count),*/
            ],
          ),
        ),
      )
    );
  }


  Widget tableCounterContainer(
      {required int tableNumber,
      required int votes,}) {

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(5),
      child: Center(
        child: Text(
          "Mesa $tableNumber\n$votes votos",
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
