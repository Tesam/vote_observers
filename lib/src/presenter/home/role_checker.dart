import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/home.dart';
import 'package:vote_observers/src/core/params/table_identification_param.dart';
import 'package:vote_observers/src/presenter/voters/voters_table.dart';
import 'package:vote_observers/src/presenter/widgets/csm_loading_screen.dart';

class RoleChecker extends StatelessWidget {
  const RoleChecker({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
              body: Center(
            child: Text(snapshot.error.toString()),
          ));
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CSMLoadingScreen();
          default:
            if (snapshot.data!['role'] == "observer") {
              return VoterTable(
                  tableId: TableIdentificationParam(
                      group: snapshot.data!['group'],
                      state: snapshot.data!['state'],
                      city: snapshot.data!['city'],
                      place: snapshot.data!['place'],
                      table: snapshot.data!['table']));
            } else {
              return const Home();
            }
        }
      },
    );
  }
}