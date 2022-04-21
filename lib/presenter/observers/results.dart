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
  final TextEditingController consejo_8 = TextEditingController();
  final TextEditingController consejo_9 = TextEditingController();
  final TextEditingController consejo_10 = TextEditingController();
  final TextEditingController consejo_11 = TextEditingController();
  final TextEditingController consejo_12 = TextEditingController();

  final TextEditingController vigilancia_1 = TextEditingController();
  final TextEditingController vigilancia_2 = TextEditingController();
  final TextEditingController vigilancia_3 = TextEditingController();
  final TextEditingController vigilancia_4 = TextEditingController();
  final TextEditingController vigilancia_5 = TextEditingController();
  final TextEditingController vigilancia_6 = TextEditingController();
  final TextEditingController vigilancia_7 = TextEditingController();
  final TextEditingController vigilancia_8 = TextEditingController();
  final TextEditingController vigilancia_9 = TextEditingController();
  final TextEditingController vigilancia_10 = TextEditingController();

  final TextEditingController tribunal_1 = TextEditingController();
  final TextEditingController tribunal_2 = TextEditingController();
  final TextEditingController tribunal_3 = TextEditingController();
  final TextEditingController tribunal_4 = TextEditingController();
  //final TextEditingController tribunal_5 = TextEditingController();

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
                        "ATILIO BENITEZ",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo1");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo1", incrementValue: int.parse(consejo_1.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo1", incrementValue: int.parse(consejo_1.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ATILIO BENITEZ se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ATILIO BENITEZ NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo1", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo1", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo1", incrementValue: int.parse(consejo_1.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo1", incrementValue: int.parse(consejo_1.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ATILIO BENITEZ se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ATILIO BENITEZ NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_1.text = "";
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
                        "CLARA MACIEL",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo2");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo2", incrementValue: int.parse(consejo_2.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo1", incrementValue: int.parse(consejo_1.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ATILIO BENITEZ se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de CLARA MACIEL NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo2", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo2", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo2", incrementValue: int.parse(consejo_2.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo2", incrementValue: int.parse(consejo_2.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de CLARA MACIEL se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de CLARA MACIEL NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_2.text = "";
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
                        "FERNANDO RIOS",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo3");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo3", incrementValue: int.parse(consejo_3.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo3", incrementValue: int.parse(consejo_3.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de FERNANDO RIOS se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de FERNANDO RIOS NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo3", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo3", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo3", incrementValue: int.parse(consejo_3.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo3", incrementValue: int.parse(consejo_3.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de FERNANDO RIOS se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de FERNANDO RIOS NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_3.text = "";
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
                        "HUGO AQUINO",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo4");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo4", incrementValue: int.parse(consejo_4.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo4", incrementValue: int.parse(consejo_4.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de HUGO AQUINO se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de HUGO AQUINO NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo4", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo4", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo4", incrementValue: int.parse(consejo_4.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo4", incrementValue: int.parse(consejo_4.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de HUGO AQUINO se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de HUGO AQUINO NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_4.text = "";
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
                        "ARNALDO ARANDA",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo5");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo5", incrementValue: int.parse(consejo_5.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo5", incrementValue: int.parse(consejo_5.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ARNALDO ARANDA se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ARNALDO ARANDA NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo5", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo5", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo5", incrementValue: int.parse(consejo_5.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo5", incrementValue: int.parse(consejo_5.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ARNALDO ARANDA se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ARNALDO ARANDA NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_5.text = "";
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
                        "JESUS QUINTANA",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo6");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo6", incrementValue: int.parse(consejo_6.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo6", incrementValue: int.parse(consejo_6.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de JESUS QUINTANA se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de JESUS QUINTANA NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo6", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo6", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo6", incrementValue: int.parse(consejo_6.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo6", incrementValue: int.parse(consejo_6.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de JESUS QUINTANA se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de JESUS QUINTANA NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_6.text = "";
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
                        "LAURA FURTADO",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo7");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo7", incrementValue: int.parse(consejo_7.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo7", incrementValue: int.parse(consejo_7.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de LAURA FURTADO se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de LAURA FURTADO NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo7", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo7", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo7", incrementValue: int.parse(consejo_7.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo7", incrementValue: int.parse(consejo_7.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de LAURA FURTADO se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de LAURA FURTADO NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_7.text = "";
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_8,
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo8");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo8", incrementValue: int.parse(consejo_8.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo8", incrementValue: int.parse(consejo_8.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de MARCOS GOITIA se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de MARCOS GOITIA NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo8", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo8", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo8", incrementValue: int.parse(consejo_8.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo8", incrementValue: int.parse(consejo_8.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de MARCOS GOITIA se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de MARCOS GOITIA NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_8.text = "";
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_9,
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo9");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo9", incrementValue: int.parse(consejo_9.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo9", incrementValue: int.parse(consejo_9.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ENRIQUE PELOZO se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ENRIQUE PELOZO NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo9", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo9", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo9", incrementValue: int.parse(consejo_9.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo9", incrementValue: int.parse(consejo_9.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ENRIQUE PELOZO se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ENRIQUE PELOZO NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_9.text = "";
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_10,
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo10");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo10", incrementValue: int.parse(consejo_10.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo10", incrementValue: int.parse(consejo_10.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ALEJANDRA ROLON se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ALEJANDRA ROLON NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo10", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo10", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo10", incrementValue: int.parse(consejo_10.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo10", incrementValue: int.parse(consejo_10.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ALEJANDRA ROLON se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ALEJANDRA ROLON NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_10.text = "";
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_11,
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo11");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo11", incrementValue: int.parse(consejo_11.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo11", incrementValue: int.parse(consejo_11.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de NILZA RODAS se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de NILZA RODAS NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo11", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo11", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo11", incrementValue: int.parse(consejo_11.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo11", incrementValue: int.parse(consejo_11.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de NILZA RODAS se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de NILZA RODAS NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_11.text = "";
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: consejo_12,
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_consejo12");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo12", incrementValue: int.parse(consejo_12.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo12", incrementValue: int.parse(consejo_12.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de GREGORIA CARDOZO se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de GREGORIA CARDOZO NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "consejo12", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_consejo12", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_consejo12", incrementValue: int.parse(consejo_12.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "consejo12", incrementValue: int.parse(consejo_12.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de GREGORIA CARDOZO se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de GREGORIA CARDOZO NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              consejo_12.text = "";
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
                        "MIRTA MACIEL",
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
                                //get actual count number
                                final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_vigilancia1");

                                //add firts count
                                if(count == 0){
                                  final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia1", incrementValue: int.parse(vigilancia_1.text));
                                  if(isAdded){
                                    countersTable.incrementCounter(docID: "vigilancia1", incrementValue: int.parse(vigilancia_1.text));
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text(
                                        'El conteo de MIRTA MACIEL se agregó correctamente',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black, fontSize: 16),
                                      ),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: MyTheme.primaryColor,
                                      padding:
                                      EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                    ));
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text(
                                        'El conteo de MIRTA MACIEL NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black, fontSize: 16),
                                      ),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: MyTheme.redColor,
                                      padding:
                                      EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                    ));
                                  }
                                }
                                else{
                                  //reset last counter on general counter
                                  await countersTable.decrementCounter(docID: "vigilancia1", decrementValue: count);
                                  //reset last counter on specific table
                                  await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_vigilancia1", decrementValue: count);

                                  final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia1", incrementValue: int.parse(vigilancia_1.text));
                                  if(isAdded){
                                    countersTable.incrementCounter(docID: "vigilancia1", incrementValue: int.parse(vigilancia_1.text));
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text(
                                        'El conteo de MIRTA MACIEL se ACTUALIZÓ correctamente',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black, fontSize: 16),
                                      ),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: MyTheme.primaryColor,
                                      padding:
                                      EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                    ));
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text(
                                        'El conteo de MIRTA MACIEL NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black, fontSize: 16),
                                      ),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: MyTheme.redColor,
                                      padding:
                                      EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                    ));
                                  }
                                }

                                vigilancia_1.text = "";
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
                        "ALICIA GONZALEZ",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_vigilancia2");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia2", incrementValue: int.parse(vigilancia_2.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia2", incrementValue: int.parse(vigilancia_2.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ALICIA GONZALEZ se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ALICIA GONZALEZ NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "vigilancia2", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_vigilancia2", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia2", incrementValue: int.parse(vigilancia_2.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia2", incrementValue: int.parse(vigilancia_2.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ALICIA GONZALEZ se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de ALICIA GONZALEZ NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              vigilancia_2.text = "";
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
                        "JOSE ZORILLA",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_vigilancia3");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia3", incrementValue: int.parse(vigilancia_3.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia3", incrementValue: int.parse(vigilancia_3.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de JOSE ZORILLA se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de JOSE ZORILLA NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "vigilancia3", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_vigilancia3", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia3", incrementValue: int.parse(vigilancia_3.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia3", incrementValue: int.parse(vigilancia_3.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de JOSE ZORILLA se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de JOSE ZORILLA NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              vigilancia_3.text = "";
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
                        "FREDIS FLORES",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_vigilancia4");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia4", incrementValue: int.parse(vigilancia_4.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia4", incrementValue: int.parse(vigilancia_4.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de FREDIS FLORES se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de FREDIS FLORES NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "vigilancia4", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_vigilancia4", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia4", incrementValue: int.parse(vigilancia_4.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia4", incrementValue: int.parse(vigilancia_4.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de FREDIS FLORES se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de FREDIS FLORES NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              vigilancia_4.text = "";
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
                        "LUIS A. ROLON",
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_vigilancia5");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia5", incrementValue: int.parse(vigilancia_5.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia5", incrementValue: int.parse(vigilancia_5.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de LUIS A. ROLON se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de LUIS A. ROLON NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "vigilancia5", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_vigilancia5", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia5", incrementValue: int.parse(vigilancia_5.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia5", incrementValue: int.parse(vigilancia_5.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de LUIS A. ROLON se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de LUIS A. ROLON NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              vigilancia_5.text = "";
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: vigilancia_6,
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_vigilancia6");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia6", incrementValue: int.parse(vigilancia_6.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia6", incrementValue: int.parse(vigilancia_6.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de VICTOR LEGUIZAMON se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de VICTOR LEGUIZAMON NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "vigilancia6", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_vigilancia6", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia6", incrementValue: int.parse(vigilancia_6.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia6", incrementValue: int.parse(vigilancia_6.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de VICTOR LEGUIZAMON se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de VICTOR LEGUIZAMON NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              vigilancia_6.text = "";
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: vigilancia_7,
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_vigilancia7");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia7", incrementValue: int.parse(vigilancia_7.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia7", incrementValue: int.parse(vigilancia_7.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de GUSTAVO VEGA se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de GUSTAVO VEGA NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "vigilancia7", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_vigilancia7", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia7", incrementValue: int.parse(vigilancia_7.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia7", incrementValue: int.parse(vigilancia_7.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de GUSTAVO VEGA se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de GUSTAVO VEGA NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              vigilancia_7.text = "";
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: vigilancia_8,
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_vigilancia8");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia8", incrementValue: int.parse(vigilancia_8.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia8", incrementValue: int.parse(vigilancia_8.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de NILDA CARDOZO se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de NILDA CARDOZO NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "vigilancia8", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_vigilancia8", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia8", incrementValue: int.parse(vigilancia_8.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia8", incrementValue: int.parse(vigilancia_8.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de NILDA CARDOZO se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de NILDA CARDOZO NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              vigilancia_8.text = "";
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: vigilancia_9,
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_vigilancia9");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia9", incrementValue: int.parse(vigilancia_9.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia9", incrementValue: int.parse(vigilancia_9.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de BENITO VANNI se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de BENITO VANNI NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "vigilancia9", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_vigilancia9", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia9", incrementValue: int.parse(vigilancia_9.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia9", incrementValue: int.parse(vigilancia_9.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de BENITO VANNI se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de BENITO VANNI NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              vigilancia_9.text = "";
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 180,
                            child: MyTextField(
                              hintText: "Cantidad de votos",
                              textEditingController: vigilancia_10,
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
                              //get actual count number
                              final int count = await tableResultsTable.getCounter(docID: "table${widget.tableNumber}_vigilancia10");

                              //add firts count
                              if(count == 0){
                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia10", incrementValue: int.parse(vigilancia_10.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia10", incrementValue: int.parse(vigilancia_10.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de YANINA AGUERO se agregó correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de YANINA AGUERO NO se agregó correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }
                              else{
                                //reset last counter on general counter
                                await countersTable.decrementCounter(docID: "vigilancia10", decrementValue: count);
                                //reset last counter on specific table
                                await tableResultsTable.decrementCounter(docID: "table${widget.tableNumber}_vigilancia10", decrementValue: count);

                                final bool isAdded = await tableResultsTable.incrementCounter(docID: "table${widget.tableNumber}_vigilancia10", incrementValue: int.parse(vigilancia_10.text));
                                if(isAdded){
                                  countersTable.incrementCounter(docID: "vigilancia10", incrementValue: int.parse(vigilancia_10.text));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de YANINA AGUERO se ACTUALIZÓ correctamente',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.primaryColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'El conteo de YANINA AGUERO NO SE ACTUALIZÓ correctamente, por favor vuelve a INTENTARLO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ));
                                }
                              }

                              vigilancia_10.text = "";
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
                /*Container(
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
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
