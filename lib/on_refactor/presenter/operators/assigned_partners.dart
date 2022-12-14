import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vote_observers/on_refactor/domain/models/partner.dart';
import 'package:vote_observers/on_refactor/presenter/operators/assing_operator.dart';
import 'package:vote_observers/on_refactor/presenter/operators/operatorsList/operators_provider.dart';
import 'package:vote_observers/on_refactor/presenter/utils.dart';
import 'package:vote_observers/src/my_theme.dart';

class AssignedPartners extends StatelessWidget {
  final String currentOperatorName;
  const AssignedPartners({
    Key? key,
    required this.currentOperatorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OperatorsProvider>(builder: (_, provider, __) {
      int c = 0;
      int noVoters = 0;
      for (int i = 0; i < provider.assignedPartners.length; i++) {
        Partner partner = provider.assignedPartners[i];
        if (partner.voteState) {
          c++;
        }else{
          noVoters++;
        }
      }

      return Scaffold(
        appBar: AppBar(
          title: Text(
            currentOperatorName,
            style: const TextStyle(color: MyTheme.gray2Text),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: MyTheme.background,
        ),
        backgroundColor: MyTheme.background,
        body: (provider.isLoading)
            ? const Center(
          child: CircularProgressIndicator(
            color: MyTheme.darkGreen,
          ),
        )
            : Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 20.0),
          child: Column(
            children: [
              ///TODO: Enabled searchbar
              /*Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: CircleAvatar(
                      backgroundColor: MyTheme.primaryColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      maxRadius: 25,
                    ),
                  ),
                ],
              ),*/
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyTheme.primary100),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "$c Socios votaron",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: MyTheme.darkGreen,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyTheme.lightYellow),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "$noVoters Socios faltan votar",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: MyTheme.darkYellow,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: (provider.assignedPartners.isNotEmpty)
                    ? ListView.builder(
                  itemBuilder: (context, index) => partnerContainer(
                      partner: provider.assignedPartners[index],
                      context: context),
                  itemCount: provider.assignedPartners.length,
                )
                    : const Center(
                  child: Text(
                      "Este operador no tiene socios asignados"),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AssignOperator(
                operatorIdentification:
                provider.currentOperator!.identification.toString(),
              ),
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: MyTheme.primaryColor,
        ),
      );
    });
  }

  Widget partnerContainer(
      {required Partner partner, required BuildContext context}) =>
      Stack(
        children: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    partner.name,
                    style: const TextStyle(
                        fontSize: 18.0,
                        color: MyTheme.gray2Text,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    (partner.phone.isEmpty) ? "Sin tel??fono" : partner.phone,
                    style: const TextStyle(
                        fontSize: 11.0,
                        color: MyTheme.gray2Text,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        partner.subsidiary,
                        style: const TextStyle(
                            fontSize: 12.0,
                            color: MyTheme.gray3Text,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Mesa ${partner.tableNumber}",
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
            onTap: () {
              _showCallDialog(context: context, partner: partner);
            },
          ),
          CircleAvatar(
            backgroundColor:
            (partner.voteState) ? MyTheme.primaryColor : MyTheme.redColor,
            radius: 10,
          ),
        ],
        alignment: const Alignment(0.9, -1.2),
      );

  Future<void> _showCallDialog(
      {required BuildContext context, required Partner partner}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Llamar",
            style: TextStyle(color: MyTheme.darkGreen),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          content: SingleChildScrollView(
            child: RichText(
              text: TextSpan(
                text: 'Desea llamar al socio ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: partner.name,
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
                'Llamar',
                style: TextStyle(color: MyTheme.darkGreen),
              ),
              onPressed: () {
                (partner.phone.isEmpty)
                    ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'N??mero de tel??fono NO asignado',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: MyTheme.redColor,
                  padding:
                  EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                ))
                    : makePhoneCall('tel:${partner.phone}');
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
