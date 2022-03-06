import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/data/partners_table.dart';
import 'package:vote_observers/domain/models/partner.dart';
import 'package:vote_observers/presenter/my_theme.dart';
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
  final TextEditingController searchController = TextEditingController();
  String searchValue = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        _onInit();
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
                /*Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: MyTheme.primaryColor),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.only(right: 8),
                          child: const Text(
                            "San Juan",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.only(right: 8),
                          child: Text(
                            "San Ignacio",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.only(right: 8),
                          child: Text(
                            "Ayolas",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.only(right: 8),
                          child: Text(
                            "Pilar",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.only(right: 8),
                          child: Text(
                            "Encarnación",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),*/
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Center(
                    child: partners.isNotEmpty
                        ? ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: scrollController,
                            itemCount: partners.length,
                            itemBuilder: (context, index) {
                              return partnerContainer(partner: partners[index]);
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

  Widget partnerContainer({required Partner partner}) {
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
  /*  setState(() {
      searchValue = newValue;
    });*/
  }
}
