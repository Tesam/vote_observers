import 'package:flutter/material.dart';
import 'package:vote_observers/on_refactor/data/counters_table.dart';
import 'package:vote_observers/on_refactor/presenter/candidates/candidates_tables.dart';
import 'package:vote_observers/src/my_theme.dart';

class Candidates extends StatefulWidget {
  const Candidates({Key? key}) : super(key: key);

  @override
  _CandidatesState createState() => _CandidatesState();
}

class _CandidatesState extends State<Candidates> {
  static CountersTable countersTable = CountersTable();

  late int consejo1;
  late int consejo2;
  late int consejo3;
  late int consejo4;
  late int consejo5;
  late int consejo6;
  late int consejo7;
  late int consejo8;
  late int consejo9;
  late int consejo10;
  late int consejo11;
  late int consejo12;

  late int vigilancia1;
  late int vigilancia2;
  late int vigilancia3;
  late int vigilancia4;
  late int vigilancia5;
  late int vigilancia6;
  late int vigilancia7;
  late int vigilancia8;
  late int vigilancia9;
  late int vigilancia10;

  late int tribunal1;
  late int tribunal2;
  late int tribunal3;
  late int tribunal4;
  //late int tribunal5;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getCounters();
  }

  Future<void> getCounters() async {
    setState(() {
      _isLoading = true;
    });
    final int con1 = await countersTable.getCounter(docID: "consejo1");
    final int con2 = await countersTable.getCounter(docID: "consejo2");
    final int con3 = await countersTable.getCounter(docID: "consejo3");
    final int con4 = await countersTable.getCounter(docID: "consejo4");
    final int con5 = await countersTable.getCounter(docID: "consejo5");
    final int con6 = await countersTable.getCounter(docID: "consejo6");
    final int con7 = await countersTable.getCounter(docID: "consejo7");
    final int con8 = await countersTable.getCounter(docID: "consejo8");
    final int con9 = await countersTable.getCounter(docID: "consejo9");
    final int con10 = await countersTable.getCounter(docID: "consejo10");
    final int con11 = await countersTable.getCounter(docID: "consejo11");
    final int con12 = await countersTable.getCounter(docID: "consejo12");

    final int vig1 = await countersTable.getCounter(docID: "vigilancia1");
    final int vig2 = await countersTable.getCounter(docID: "vigilancia2");
    final int vig3 = await countersTable.getCounter(docID: "vigilancia3");
    final int vig4 = await countersTable.getCounter(docID: "vigilancia4");
    final int vig5 = await countersTable.getCounter(docID: "vigilancia5");
    final int vig6 = await countersTable.getCounter(docID: "vigilancia6");
    final int vig7 = await countersTable.getCounter(docID: "vigilancia7");
    final int vig8 = await countersTable.getCounter(docID: "vigilancia8");
    final int vig9 = await countersTable.getCounter(docID: "vigilancia9");
    final int vig10 = await countersTable.getCounter(docID: "vigilancia10");

    final int tri1 = await countersTable.getCounter(docID: "tribunal1");
    final int tri2 = await countersTable.getCounter(docID: "tribunal2");
    final int tri3 = await countersTable.getCounter(docID: "tribunal3");
    final int tri4 = await countersTable.getCounter(docID: "tribunal4");
    //final int tri5 = await countersTable.getCounter(docID: "tribunal5");

    setState(() {
      _isLoading = false;
      consejo1 = con1;
      consejo2 = con2;
      consejo3 = con3;
      consejo4 = con4;
      consejo5 = con5;
      consejo6 = con6;
      consejo7 = con7;
      consejo8 = con8;
      consejo9 = con9;
      consejo10 = con10;
      consejo11 = con11;
      consejo12 = con12;

      vigilancia1 = vig1;
      vigilancia2 = vig2;
      vigilancia3 = vig3;
      vigilancia4 = vig4;
      vigilancia5 = vig5;
      vigilancia6 = vig6;
      vigilancia7 = vig7;
      vigilancia8 = vig8;
      vigilancia9 = vig9;
      vigilancia10 = vig10;

      tribunal1 = tri1;
      tribunal2 = tri2;
      tribunal3 = tri3;
      tribunal4 = tri4;
      //tribunal5 = tri5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Conteo",
            style: TextStyle(color: MyTheme.gray2Text),
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
            color: MyTheme.darkGreen,
            onRefresh: () async => await getCounters(),
            child: (_isLoading)
                ? const Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.darkGreen,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: ListView(
                      children: [
                        const Text(
                          "Consejo de Administración",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.primary100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "ATILIO BENITEZ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$consejo1 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                      candidateName: "ATILIO BENITEZ",
                                      candidate: 1,
                                      place: "consejo",
                                    )),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                      candidateName:
                                          "CLARA MACIEL",
                                      candidate: 2,
                                      place: "consejo",
                                    )),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.primary100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 2",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "CLARA MACIEL",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$consejo2 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                      candidateName:
                                          "FERNANDO RIOS",
                                      candidate: 3,
                                      place: "consejo",
                                    )),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.primary100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 3",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "FERNANDO RIOS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$consejo3 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "HUGO AQUINO",
                                    candidate: 4,
                                    place: "consejo",
                                  )),
                            ),
                            child:  Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.primary100,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 4",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "HUGO AQUINO",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$consejo4 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "ARNALDO ARANDA",
                                    candidate: 5,
                                    place: "consejo",
                                  )),
                            ),
                            child:  Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.primary100,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 5",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "ARNALDO ARANDA",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$consejo5 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "JESUS QUINTANA",
                                    candidate: 6,
                                    place: "consejo",
                                  )),
                            ),
                            child:  Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.primary100,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 6",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "JESUS QUINTANA",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$consejo6 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "LAURA FURTADO",
                                    candidate: 7,
                                    place: "consejo",
                                  )),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.primary100,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 7",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "LAURA FURTADO",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$consejo7 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                  candidateName:
                                  "MARCOS GOITIA",
                                  candidate: 8,
                                  place: "consejo",
                                )),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.primary100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 8",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "MARCOS GOITIA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$consejo8 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                  candidateName:
                                  "ENRIQUE PELOZO",
                                  candidate: 9,
                                  place: "consejo",
                                )),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.primary100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 9",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "ENRIQUE PELOZO",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$consejo9 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                  candidateName:
                                  "ALEJANDRA ROLON",
                                  candidate: 10,
                                  place: "consejo",
                                )),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.primary100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 10",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "ALEJANDRA ROLON",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$consejo10 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                  candidateName:
                                  "NILZA RODAS",
                                  candidate: 11,
                                  place: "consejo",
                                )),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.primary100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 11",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "NILZA RODAS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$consejo11 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                  candidateName:
                                  "GREGORIA CARDOZO",
                                  candidate: 12,
                                  place: "consejo",
                                )),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.primary100,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 12",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "GREGORIA CARDOZO",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$consejo12 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Junta de Vigilancia",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "MIRTA MACIEL",
                                    candidate: 1,
                                    place: "vigilancia",
                                  )),
                            ),
                            child:Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.lightYellow,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "MIRTA MACIEL",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$vigilancia1 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "ALICIA GONZALEZ",
                                    candidate: 2,
                                    place: "vigilancia",
                                  )),
                            ),
                            child:Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.lightYellow,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 2",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "ALICIA GONZALEZ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$vigilancia2 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "JOSE ZORILLA",
                                    candidate: 3,
                                    place: "vigilancia",
                                  )),
                            ),
                            child:  Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.lightYellow,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 3",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "JOSE ZORILLA",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$vigilancia3 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "FREDIS FLORES",
                                    candidate: 4,
                                    place: "vigilancia",
                                  )),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.lightYellow,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 4",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "FREDIS FLORES",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$vigilancia4 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "LUIS A. ROLON",
                                    candidate: 5,
                                    place: "vigilancia",
                                  )),
                            ),
                            child:Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.lightYellow,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 5",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "LUIS A. ROLON",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$vigilancia5 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                  candidateName:
                                  "VICTOR LEGUIZAMON",
                                  candidate: 6,
                                  place: "vigilancia",
                                )),
                          ),
                          child:Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.lightYellow,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 6",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "VICTOR LEGUIZAMON",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$vigilancia6 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                  candidateName:
                                  "GUSTAVO VEGA",
                                  candidate: 7,
                                  place: "vigilancia",
                                )),
                          ),
                          child:Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.lightYellow,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 7",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "GUSTAVO VEGA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$vigilancia7 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                  candidateName:
                                  "NILDA CARDOZO",
                                  candidate: 8,
                                  place: "vigilancia",
                                )),
                          ),
                          child:Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.lightYellow,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 8",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "NILDA CARDOZO",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$vigilancia8 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                  candidateName:
                                  "BENITO VANNI",
                                  candidate: 9,
                                  place: "vigilancia",
                                )),
                          ),
                          child:Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.lightYellow,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 9",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "BENITO VANNI",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$vigilancia9 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CandidatesTables(
                                  candidateName:
                                  "YANINA AGUERO",
                                  candidate: 10,
                                  place: "vigilancia",
                                )),
                          ),
                          child:Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: MyTheme.lightYellow,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugar 10",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "YANINA AGUERO",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "$vigilancia10 ",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'votos',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Tribunal Electoral Independiente",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "URSINO CABALLERO",
                                    candidate: 1,
                                    place: "tribunal",
                                  )),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.lightBlue,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "URSINO CABALLERO",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$tribunal1 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "YAMIL RIVEROS",
                                    candidate: 2,
                                    place: "tribunal",
                                  )),
                            ),
                            child:   Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.lightBlue,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 2",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "YAMIL RIVEROS",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$tribunal2 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "RUTH AYALA",
                                    candidate: 3,
                                    place: "tribunal",
                                  )),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.lightBlue,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 3",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "RUTH AYALA",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$tribunal3 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "ALICIA PEDROZO",
                                    candidate: 4,
                                    place: "tribunal",
                                  )),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.lightBlue,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 4",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "ALICIA PEDROZO",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$tribunal4 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                       /* InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CandidatesTables(
                                    candidateName:
                                    "FELISA LOPEZ BAEZ",
                                    candidate: 5,
                                    place: "tribunal",
                                  )),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: MyTheme.lightBlue,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Lugar 5",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "FELISA LOPEZ BAEZ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "$tribunal5 ",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'votos',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color: MyTheme.gray2Text)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ),*/
                      ],
                    ),
                  )));
  }
}
