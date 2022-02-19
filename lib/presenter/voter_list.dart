import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

enum VoteStatus { voted, notVoted }

class VoterList extends StatelessWidget {
  const VoterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream documentStream =
        FirebaseFirestore.instance.collection('tables').doc('1').snapshots();

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<dynamic>(
          stream: documentStream,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Algo salió mal'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            }

            var documentFields = snapshot.data;
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  color: MyTheme.darkColor,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Text(
                        "${documentFields["observer"]}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Mesa ${documentFields.id}",
                        style: const TextStyle(
                            color: MyTheme.grayBackground, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: snapshot.data["voters"].map<Widget>((document) {
                      return orderContainer(
                          index: document["order"],
                          context: context,
                          voter: document["name"],
                          voteStatus: (document["state"])
                              ? VoteStatus.voted
                              : VoteStatus.notVoted);
                    }).toList(),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget orderContainer(
          {required String index,
          required String voter,
          VoteStatus voteStatus = VoteStatus.notVoted,
          required BuildContext context}) =>
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
                      ? MyTheme.darkColor
                      : MyTheme.grayText,
                  fontSize: 20.0),
            ),
          ),
        ),
        onTap: () => (voteStatus == VoteStatus.notVoted)
            ? _showAddVoterDialog(context: context, voter: voter)
            : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('El voto ya fue registrado!'),
              )),
      );

  Future<void> _showAddVoterDialog(
      {required BuildContext context, required String voter}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Agregar voto",
            style: TextStyle(color: MyTheme.darkColor),
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
                style: TextStyle(color: MyTheme.grayText),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Agregar',
                style: TextStyle(color: MyTheme.darkColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
