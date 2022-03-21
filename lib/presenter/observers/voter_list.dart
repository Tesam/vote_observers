import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/observers/results.dart';

enum VoteStatus { voted, notVoted }

class VoterList extends StatelessWidget {
  final String tableNumber;

  const VoterList({Key? key, required this.tableNumber}) : super(key: key);

  Future<void> updatePartnerOnTable({required String order}) {
    CollectionReference table =
        FirebaseFirestore.instance.collection('table_$tableNumber');

    return table
        .doc(order)
        .set({"state": true}, SetOptions(merge: true))
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> updatePartnerGeneral({required String identification}) {
    CollectionReference partners =
        FirebaseFirestore.instance.collection('partners');

    return partners
        .doc(identification)
        .set({"vote_state": true}, SetOptions(merge: true))
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    Stream collectionStream =
        FirebaseFirestore.instance.collection('table_$tableNumber').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mesa $tableNumber",
          style: const TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyTheme.background,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(
                          Icons.post_add,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    Results(tableNumber: tableNumber)),
                          );
                        },
                        title: const Text(
                          "Agregar Resultado",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      value: 1,
                    ),
                  ]),
        ],
      ),
      backgroundColor: MyTheme.background,
      body: StreamBuilder<dynamic>(
        stream: collectionStream,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Algo salió mal'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  children: snapshot.data!.docs.map<Widget>((document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return orderContainer(
                        index: data["order"],
                        identification: data["identification"],
                        context: context,
                        voter: data["name"],
                        voteStatus: (data["state"])
                            ? VoteStatus.voted
                            : VoteStatus.notVoted);
                  }).toList(),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget orderContainer(
          {required String index,
          required String voter,
          VoteStatus voteStatus = VoteStatus.notVoted,
          required BuildContext context,
          required String identification}) =>
      InkWell(
          child: Container(
            width: 80.0,
            height: 80.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: (voteStatus == VoteStatus.voted)
                    ? MyTheme.primaryColor
                    : MyTheme.grayBackground),
            child: Center(
              child: Text(
                index,
                style: TextStyle(
                    color: (voteStatus == VoteStatus.voted)
                        ? MyTheme.darkGreen
                        : MyTheme.gray2Text,
                    fontSize: 20.0),
              ),
            ),
          ),
          onTap: () => (voteStatus == VoteStatus.notVoted)
              ? _showAddVoterDialog(
                  context: context,
                  voter: voter,
                  index: index,
                  identification: identification)
              : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'El voto ya fue registrado!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: MyTheme.lightYellow,
                  padding: EdgeInsets.symmetric(vertical: 40),
                )));

  Future<void> _showAddVoterDialog(
      {required BuildContext context,
      required String voter,
      required String identification,
      required String index}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Agregar voto",
            style: TextStyle(color: MyTheme.darkGreen),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SingleChildScrollView(
            child: RichText(
              text: TextSpan(
                text: 'Desea agregar voto de ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: voter,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: '?'),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: MyTheme.gray2Text),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Agregar',
                style: TextStyle(color: MyTheme.darkGreen),
              ),
              onPressed: () {
                updatePartnerOnTable(order: index);
                updatePartnerGeneral(identification: identification);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Voto registrado correctamente',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: MyTheme.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 40),
                ));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
