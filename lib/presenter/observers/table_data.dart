import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/observers/voter_list.dart';

class TableData extends StatelessWidget {
  final String tableNumber;

  const TableData({Key? key, required this.tableNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stream collectionStream = FirebaseFirestore.instance
        .collection('table_$tableNumber')
        .orderBy("order")
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mesa $tableNumber",
          style: const TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyTheme.background,
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
              child: CircularProgressIndicator(
                color: MyTheme.darkGreen,
              ),
            );
          }

          /*return ListView.builder(
            itemBuilder: (context, index) {
              return voterContainer();
            },
            itemCount: ,

          );*/

          return ListView(
            children: snapshot.data!.docs.map<Widget>((document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return voterContainer(
                  index: data["order"],
                  identification: data["identification"],
                  voter: data["name"],
                  voteStatus:
                      (data["state"]) ? VoteStatus.voted : VoteStatus.notVoted);
            }).toList(),
          );
        },
      ),
    );
  }

  Widget voterContainer(
      {required int index,
      required int identification,
      required String voter,
      required VoteStatus voteStatus}) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                voter,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: MyTheme.gray2Text,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Orden: $index",
                style: const TextStyle(
                    fontSize: 12.0,
                    color: MyTheme.gray3Text,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cédula: $identification",
                    style: const TextStyle(
                        fontSize: 12.0,
                        color: MyTheme.gray3Text,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Mesa $tableNumber",
                    style: const TextStyle(
                        fontSize: 14.0,
                        color: MyTheme.gray3Text,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: (voteStatus == VoteStatus.voted)
              ? MyTheme.primaryColor
              : MyTheme.redColor,
          radius: 10,
        ),
      ],
      alignment: const Alignment(0.9, -1.2),
    );
  }
}
