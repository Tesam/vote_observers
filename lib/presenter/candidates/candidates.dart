import 'package:flutter/material.dart';
import 'package:vote_observers/data/counters_table.dart';
import 'package:vote_observers/presenter/candidates/candidates_tables.dart';
import 'package:vote_observers/presenter/my_theme.dart';

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

  late int vigilancia1;
  late int vigilancia2;
  late int vigilancia3;
  late int vigilancia4;
  late int vigilancia5;

  late int tribunal1;
  late int tribunal2;
  late int tribunal3;
  late int tribunal4;
  late int tribunal5;

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

    final int vig1 = await countersTable.getCounter(docID: "vigilancia1");
    final int vig2 = await countersTable.getCounter(docID: "vigilancia2");
    final int vig3 = await countersTable.getCounter(docID: "vigilancia3");
    final int vig4 = await countersTable.getCounter(docID: "vigilancia4");
    final int vig5 = await countersTable.getCounter(docID: "vigilancia5");

    final int tri1 = await countersTable.getCounter(docID: "tribunal1");
    final int tri2 = await countersTable.getCounter(docID: "tribunal2");
    final int tri3 = await countersTable.getCounter(docID: "tribunal3");
    final int tri4 = await countersTable.getCounter(docID: "tribunal4");
    final int tri5 = await countersTable.getCounter(docID: "tribunal5");

    setState(() {
      _isLoading = false;
      consejo1 = con1;
      consejo2 = con2;
      consejo3 = con3;
      consejo4 = con4;
      consejo5 = con5;
      consejo6 = con6;
      consejo7 = con7;

      vigilancia1 = vig1;
      vigilancia2 = vig2;
      vigilancia3 = vig3;
      vigilancia4 = vig4;
      vigilancia5 = vig5;

      tribunal1 = tri1;
      tribunal2 = tri2;
      tribunal3 = tri3;
      tribunal4 = tri4;
      tribunal5 = tri5;
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
                                  "ARNALDO EDUARDO PENAYO",
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
                                      candidateName: "ARNALDO EDUARDO PENAYO",
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
                                          "DELCY MAXIMINA AMARILLA FERNANDEZ",
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
                                  "DELCY MAXIMINA AMARILLA FERNANDEZ",
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
                                          "IVAN GONZALEZ GAVILAN",
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
                                  "IVAN GONZALEZ GAVILAN",
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
                                    "MARIA ALEJANDRA ROJAS IBARRA",
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
                                    "MARIA ALEJANDRA ROJAS IBARRA",
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
                                    "ALBERTO OSMAR RODAS MONZON",
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
                                    "ALBERTO OSMAR RODAS MONZON",
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
                                    "ELIDA GERTRUDIS SALINAS RAMIREZ",
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
                                    "ELIDA GERTRUDIS SALINAS RAMIREZ",
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
                                    "WALTER RAMON AQUINO PORTILLO",
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
                                    "WALTER RAMON AQUINO PORTILLO",
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
                                    "VICTOR JOSE SALAZAR CABALLERO",
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
                                    "VICTOR JOSE SALAZAR CABALLERO",
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
                                    "GERONIMO DEL VALLE PAREDES",
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
                                    "GERONIMO DEL VALLE PAREDES",
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
                                    "ALBERTO DAVID MARTINEZ AGUERO",
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
                                    "ALBERTO DAVID MARTINEZ AGUERO",
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
                                    "MAMERTO MARTINEZ ROLON",
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
                                    "MAMERTO MARTINEZ ROLON",
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
                                    "MELANIO MORINIGO GALEANO",
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
                                    "MELANIO MORINIGO GALEANO",
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
                                    "YOHANA YANINA RUIZ DIAZ ALVARENGA",
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
                                    "YOHANA YANINA RUIZ DIAZ ALVARENGA",
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
                                    "EDGAR EUSEBIO BRITEZ RIOS",
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
                                    "EDGAR EUSEBIO BRITEZ RIOS",
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
                                    "NELSON SEBERIANO VEGA",
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
                                    "NELSON SEBERIANO VEGA",
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
                                    "ANGELA AGUILERA GALEANO",
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
                                    "ANGELA AGUILERA GALEANO",
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
                        InkWell(
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
                        ),
                      ],
                    ),
                  )));
  }
}
