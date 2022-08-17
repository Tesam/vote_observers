import 'package:flutter/material.dart';
import 'package:vote_observers/on_refactor/presenter/observers/voter_list.dart';
import 'package:vote_observers/src/my_theme.dart';

class TablesObservers extends StatefulWidget {
  const TablesObservers({Key? key}) : super(key: key);

  @override
  _TablesObserversState createState() => _TablesObserversState();
}

class _TablesObserversState extends State<TablesObservers> {
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
      body: Column(
        children: [
          const Text(
            "Selecciona la mesa que te corresponde",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(10),
                children: List.generate(12, (int index) {
                  return InkWell(
                    child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Center(child: Text("Mesa ${index+1}", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),)
                    ),
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => VoterList(tableNumber: (index + 1).toString())),
                      );
                    },
                  );
                }),
                ),
          ),
        ],
      ),
    );
  }
}
