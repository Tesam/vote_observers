import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/core/params/table_identification_param.dart';
import 'package:vote_observers/src/my_theme.dart';
import 'package:vote_observers/src/presenter/home/get_user_stream_provider.dart';
import 'package:vote_observers/src/presenter/home/home_test.dart';
import 'package:vote_observers/src/presenter/voters/voters_table.dart';

class RoleChecker extends ConsumerWidget {
  const RoleChecker({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<dynamic> votingUser = ref.watch(userStreamProvider(user.uid));

    return votingUser.when(
        data: (user) {
          if (user.role == "observer") {
            return VoterTable(
              tableId: TableIdentificationParam(
                table: user.table,
                group: user.group,
                city: user.city,
                place: user.place,
                state: user.state,
              ),
            );
          } else {
            return const HomeTest();
          }
        },
        error: (err, stack) => Center(
              child: Text('Algo salió mal: $err'),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(
                color: MyTheme.darkGreen,
              ),
            ));

    /* StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.)
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
    );*/
  }
}
