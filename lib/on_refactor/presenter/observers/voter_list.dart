import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/on_refactor/data/counters_table.dart';
import 'package:vote_observers/on_refactor/data/partners_table.dart';
import 'package:vote_observers/on_refactor/domain/models/partner.dart';
import 'package:vote_observers/on_refactor/presenter/observers/results.dart';
import 'package:vote_observers/src/my_theme.dart';
import 'package:vote_observers/src/presenter/widgets/csm_button.dart';

enum VoteStatus { voted, notVoted }

class VoterList extends StatelessWidget {
  final String tableNumber;

  const VoterList({Key? key, required this.tableNumber}) : super(key: key);

  Future<void> updatePartnerOnTable({required String order}) {
    CollectionReference table =
        FirebaseFirestore.instance.collection('table_${tableNumber}_21');

    return table
        .doc(order)
        .set({"state": true}, SetOptions(merge: true))
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> updatePartnerGeneral({required String identification}) {
    CollectionReference partners =
        FirebaseFirestore.instance.collection('partners_21');

    return partners
        .doc(identification)
        .set({"vote_state": true}, SetOptions(merge: true))
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> updatePartnerAssignedVotes() async {
    CountersTable countersTable = CountersTable();
    await countersTable.incrementCounter(docID: "partners_assigned_votes");
  }

  Future<void> updatePartnerGeneralVotes() async {
    CountersTable countersTable = CountersTable();
    await countersTable.incrementCounter(docID: "partners_general_votes");
  }

  @override
  Widget build(BuildContext context) {
    Stream collectionStream = FirebaseFirestore.instance
        .collection('table_${tableNumber}_21')
        .orderBy("order")
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Colegio Natalicio Vasconcellos sdfsdfsdfsdfdsfdsf",
              style: TextStyle(
                color: MyTheme.gray3Text,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              "Mesa $tableNumber",
              style: const TextStyle(
                  color: MyTheme.gray3Text,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        iconTheme: const IconThemeData(color: MyTheme.kBackground),
        elevation: 0,
        backgroundColor: MyTheme.kLightColor,
        automaticallyImplyLeading: false,
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
      backgroundColor: MyTheme.kLightColor,
      body: StreamBuilder<dynamic>(
        stream: collectionStream,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Algo sali?? mal'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyTheme.darkGreen,
              ),
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
          {required int index,
          required String voter,
          VoteStatus voteStatus = VoteStatus.notVoted,
          required BuildContext context,
          required int identification}) =>
      InkWell(
          child: Container(
            width: 80.0,
            height: 80.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: (voteStatus == VoteStatus.voted)
                    ? MyTheme.kPrimaryColor
                    : MyTheme.grayBackground),
            child: Center(
              child: Text(
                index.toString(),
                style: TextStyle(
                    color: (voteStatus == VoteStatus.voted)
                        ? MyTheme.kBackground
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
      required int identification,
      required int index}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Agregar voto",
            style: TextStyle(color: MyTheme.kLightColor),
          ),
          actionsPadding: const EdgeInsets.all(10),
          backgroundColor: MyTheme.kBackground,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SingleChildScrollView(
            child: RichText(
              text: TextSpan(
                text: 'Desea agregar voto de ',
                style: TextStyle(color: MyTheme.kLightColor),
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
            CSMButton.small(
              onPressed: () => Navigator.of(context).pop(),
              buttonTitle: "Cancelar",
              widthPercent: 0.3,
              backgroundColor: MyTheme.kSecondaryColor,
              textColor: MyTheme.kLightColor,
            ),
            CSMButton.small(
              onPressed: () async {
                await updatePartnerOnTable(order: index.toString());
                await updatePartnerGeneral(
                    identification: identification.toString());
                await updatePartnerGeneralVotes();

                //update partners assigned votes if it's an assigned partner
                PartnersTable partnersTable = PartnersTable();
                final Partner partner = await partnersTable.getPartner(
                    partnerIdentification: identification.toString());
                if (partner.assigned) {
                  updatePartnerAssignedVotes();
                }

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Voto registrado correctamente',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: MyTheme.kPrimaryColor,
                  padding: EdgeInsets.symmetric(vertical: 40),
                ));
                Navigator.of(context).pop();
              },
              buttonTitle: "Agregar",
              widthPercent: 0.3,
            ),
          ],
        );
      },
    );
  }
}
