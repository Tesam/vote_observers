import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/data/partners_table.dart';
import 'package:vote_observers/domain/models/partner.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/observers/results.dart';
import 'package:vote_observers/src/core/params/table_identification_param.dart';
import 'package:vote_observers/src/domain/entities/voter.dart';
import 'package:vote_observers/src/presenter/voters/voters_stream.dart';
import 'package:vote_observers/src/presenter/widgets/csm_button.dart';

enum VoteStatus { voted, notVoted }

class VoterTable extends ConsumerWidget {
  final TableIdentificationParam tableId;

  const VoterTable({Key? key, required this.tableId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<dynamic> voters = ref.watch(votersStreamProvider(tableId.toString()));

    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
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
                "Mesa ${tableId.table}",
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
                                      Results(tableNumber: tableId.table)),
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
        body: voters.when(
            data: (voters) => Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: voters.map<Widget>((Voter document) {
                      return orderContainer(
                          index: document.order,
                          identification: document.voterId,
                          context: context,
                          voter: document.name,
                          voteStatus: (document.voted)
                              ? VoteStatus.voted
                              : VoteStatus.notVoted);
                    }).toList(),
                  ),
                )
              ],
            ),
            error: (err, stack) => Center(
                  child: Text('Algo salió mal: $err'),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.darkGreen,
                  ),
                )));
  }

  Widget orderContainer(
          {required int index,
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
      required String identification,
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
                style: const TextStyle(color: MyTheme.kLightColor),
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
                //  await updatePartnerOnTable(order: index.toString());
                //  await updatePartnerGeneral(identification: identification.toString());
                //      await updatePartnerGeneralVotes();

                //update partners assigned votes if it's an assigned partner
                PartnersTable partnersTable = PartnersTable();
                final Partner partner = await partnersTable.getPartner(
                    partnerIdentification: identification.toString());
                if (partner.assigned) {
                  //     updatePartnerAssignedVotes();
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
