import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/data/counters_table.dart';
import 'package:vote_observers/data/partners_table.dart';
import 'package:vote_observers/domain/models/partner.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/utils.dart';
import 'package:vote_observers/presenter/widgets/my_text_field.dart';

class Partners extends StatefulWidget {
  const Partners({Key? key}) : super(key: key);

  @override
  _PartnersState createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
  List<Partner> partners = [];
  var scrollController = ScrollController();
  PartnersTable partnersTable = PartnersTable();
  final CountersTable countersTable = CountersTable();
  final TextEditingController searchController = TextEditingController();
  String searchValue = "";
  int? partnersAssignedCount;
  int? partnersGeneralCount;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        _onInit();
        _onInitPartnersAssigned();
        _onInitPartners();
      },
    );
  }

  void _onInit() async {
    //addDocuments();
   // await partnersTable.getPartnersLength();
    _getDocuments();
    scrollController.addListener(() async {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
        } else {
          //get last document
          String partnerIdentification = partners.last.identification.toString();
          DocumentSnapshot documentSnapshot =
              await partnersTable.getPartnerDocumentByIdentification(partnerIdentification: partnerIdentification);

          //get next documents
          List<Partner> nextList = await partnersTable.getNextPartners(
              documentSnapshot: documentSnapshot);

          setState(() {
            partners.addAll(nextList);
          });
        }
      }
    });
  }

  void _getDocuments() async {
    final List<Partner> list = await partnersTable.getPartners();
    setState(() {
      partners = list;
    });
  }

  void _getPartner({required String partnerIdentification}) async {
    final Partner partner = await partnersTable.getPartner(partnerIdentification: partnerIdentification);
    setState(() {
      partners.clear();
      partners.add(partner);
    });
  }

  void addDocuments() async {
   // partnersTable.addPartners();
  }

  void _onInitPartnersAssigned() async {
    partnersAssignedCount =
    await countersTable.getCounter(docID: "partners_assigned");
    setState(() {

    });
  }

  void _onInitPartners() async {
    partnersGeneralCount =
    await countersTable.getCounter(docID: "partners_general");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Socios",
          style: TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyTheme.background,
      ),
      backgroundColor: MyTheme.background,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: RefreshIndicator(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        hintText: "Cédula de identidad del socio",
                        textEditingController: searchController,
                        onChanged: (value) => _manageEmptySerch(searchValue: value),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        backgroundColor: MyTheme.primaryColor,
                        child: IconButton(
                          onPressed: () => _getPartner(partnerIdentification: searchController.text),
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                        maxRadius: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
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
                        "$partnersGeneralCount Socios general",
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
                        "$partnersAssignedCount Socios asignados",
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
                  height: 10.0,
                ),
                Expanded(
                  child: Center(
                    child: (partners.isNotEmpty || (partnersAssignedCount != null) || (partnersGeneralCount != null))
                        ? ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: scrollController,
                            itemCount: partners.length,
                            itemBuilder: (context, index) {
                              return partnerContainer(partner: partners[index], context: context);
                            },
                          )
                        : const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                MyTheme.primaryColor),
                          ),
                  ),
                ),
              ],
            ),
            color: MyTheme.primaryColor,
            onRefresh: () async => await _getDocuments, // Refresh entire list
          )),
    );
  }

  Widget partnerContainer({required Partner partner, required BuildContext context}) {
    return Stack(
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
                  (partner.phone.isEmpty)? "Sin teléfono" : partner.phone,
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
          onTap: (){
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
  }

  void _manageEmptySerch({required String searchValue}){
    if(searchValue.isEmpty){
      _getDocuments();
    }
  }

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
                    'Número de teléfono NO asignado',
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
