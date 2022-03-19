import 'package:flutter/material.dart';
import 'package:vote_observers/data/counters_table.dart';
import 'package:vote_observers/data/table_results_table.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/widgets/my_button.dart';
import 'package:vote_observers/presenter/widgets/my_text_field.dart';

class Results extends StatefulWidget {
  final String tableNumber;

  const Results({Key? key, required this.tableNumber}) : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  final TextEditingController consejo_1 = TextEditingController();
  final TextEditingController consejo_2 = TextEditingController();
  final TextEditingController consejo_3 = TextEditingController();
  final TextEditingController consejo_4 = TextEditingController();
  final TextEditingController consejo_5 = TextEditingController();
  final TextEditingController consejo_6 = TextEditingController();
  final TextEditingController consejo_7 = TextEditingController();

  final TextEditingController vigilancia_1 = TextEditingController();
  final TextEditingController vigilancia_2 = TextEditingController();
  final TextEditingController vigilancia_3 = TextEditingController();
  final TextEditingController vigilancia_4 = TextEditingController();
  final TextEditingController vigilancia_5 = TextEditingController();

  final TextEditingController tribunal_1 = TextEditingController();
  final TextEditingController tribunal_2 = TextEditingController();
  final TextEditingController tribunal_3 = TextEditingController();
  final TextEditingController tribunal_4 = TextEditingController();
  final TextEditingController tribunal_5 = TextEditingController();

  static CountersTable countersTable = CountersTable();
  static TableResultsTable tableResultsTable = TableResultsTable();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resultados de la Mesa ${widget.tableNumber}",
          style: const TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyTheme.background,
      ),
      backgroundColor: MyTheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "Por favor, sólo ingresa los datos de la MESA ${widget.tableNumber}"),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(
              children: [
                const Text(
                  "Consejo de Administración",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
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
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "ARNALDO EDUARDO PENAYO",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_1,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo1", incrementValue: int.parse(consejo_1.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "consejo1", incrementValue: int.parse(consejo_1.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de ARNALDO EDUARDO PENAYO se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "DELCY MAXIMINA AMARILLA FERNANDEZ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_2,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo2", incrementValue: int.parse(consejo_2.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "consejo2", incrementValue: int.parse(consejo_2.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de DELCY MAXIMINA AMARILLA FERNANDEZ se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "IVAN GONZALEZ GAVILAN",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_3,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo3", incrementValue: int.parse(consejo_3.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "consejo3", incrementValue: int.parse(consejo_3.text));ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de IVAN GONZALEZ GAVILAN se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_4,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async{
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo4", incrementValue: int.parse(consejo_4.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "consejo4", incrementValue: int.parse(consejo_4.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de MARIA ALEJANDRA ROJAS IBARRA se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_5,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo5", incrementValue: int.parse(consejo_5.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "consejo5", incrementValue: int.parse(consejo_5.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de ALBERTO OSMAR RODAS MONZON se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_6,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo6", incrementValue: int.parse(consejo_6.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "consejo6", incrementValue: int.parse(consejo_6.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de ELIDA GERTRUDIS SALINAS RAMIREZ se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_7,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo7", incrementValue: int.parse(consejo_7.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "consejo7", incrementValue: int.parse(consejo_7.text)); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de WALTER RAMON AQUINO PORTILLO se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Junta de Vigilancia",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: vigilancia_1,
                              textInputType: TextInputType.number,
                              enabledBorder: true,
                              color: MyTheme.darkYellow,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(
                              title: "Agregar",
                              onPressed: () async {
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia1", incrementValue: int.parse(vigilancia_1.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia1", incrementValue: int.parse(vigilancia_1.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de VICTOR JOSE SALAZAR CABALLERO se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              },
                              color: MyTheme.darkYellow,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: vigilancia_2,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                              color: MyTheme.darkYellow,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia2", incrementValue: int.parse(vigilancia_2.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "vigilancia2", incrementValue: int.parse(vigilancia_2.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de GERONIMO DEL VALLE PAREDES se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }, color: MyTheme.darkYellow,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: vigilancia_3,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                              color: MyTheme.darkYellow,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia3", incrementValue: int.parse(vigilancia_3.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "vigilancia3", incrementValue: int.parse(vigilancia_3.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de ALBERTO DAVID MARTINEZ AGUERO se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }, color: MyTheme.darkYellow,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: vigilancia_4,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                              color: MyTheme.darkYellow,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia4", incrementValue: int.parse(vigilancia_4.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "vigilancia4", incrementValue: int.parse(vigilancia_4.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de MAMERTO MARTINEZ ROLON se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }, color: MyTheme.darkYellow,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: vigilancia_5,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                              color: MyTheme.darkYellow,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia5", incrementValue: int.parse(vigilancia_5.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "vigilancia5", incrementValue: int.parse(vigilancia_5.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de MELANIO MORINIGO GALEANO se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }, color: MyTheme.darkYellow,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Tribunal Electoral Independiente",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: tribunal_1,
                              textInputType: TextInputType.number,
                              enabledBorder: true,
                              color: MyTheme.darkBlue,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(
                              title: "Agregar",
                              onPressed: () async {
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_tribunal1", incrementValue: int.parse(tribunal_1.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "tribunal1", incrementValue: int.parse(tribunal_1.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de YOHANA YANINA RUIZ DIAZ ALVARENGA se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              },
                              color: MyTheme.darkBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: tribunal_2,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                              color: MyTheme.darkBlue,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_tribunal2", incrementValue: int.parse(tribunal_2.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "tribunal2", incrementValue: int.parse(tribunal_2.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de EDGAR EUSEBIO BRITEZ RIOS se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }, color: MyTheme.darkBlue,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: tribunal_3,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                              color: MyTheme.darkBlue,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_tribunal3", incrementValue: int.parse(tribunal_3.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "tribunal3", incrementValue: int.parse(tribunal_3.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de NELSON SEBERIANO VEGA se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }, color: MyTheme.darkBlue,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: tribunal_4,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                              color: MyTheme.darkBlue,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_tribunal4", incrementValue: int.parse(tribunal_4.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "tribunal4", incrementValue: int.parse(tribunal_4.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de ANGELA AGUILERA GALEANO se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }, color: MyTheme.darkBlue,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: tribunal_5,
                              enabledBorder: true,
                              textInputType: TextInputType.number,
                              color: MyTheme.darkBlue,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: MyButton(title: "Agregar", onPressed: () async {
                              final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_tribunal5", incrementValue: int.parse(tribunal_5.text));
                              if(isAdded){
                                countersTable.incrementCounter(docID: "tribunal5", incrementValue: int.parse(tribunal_5.text));
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                    'El conteo de FELISA LOPEZ BAEZ se agregó correctamente',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: MyTheme.primaryColor,
                                  padding:
                                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                ));
                              }
                            }, color: MyTheme.darkBlue,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
