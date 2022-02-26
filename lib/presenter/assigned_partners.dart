import 'package:flutter/material.dart';
import 'package:vote_observers/data/partners_table.dart';
import 'package:vote_observers/domain/models/partner.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class AssignedPartners extends StatefulWidget {
  final List<dynamic> assignedPartners;

  const AssignedPartners({Key? key, required this.assignedPartners})
      : super(key: key);

  @override
  _AssignedPartnersState createState() => _AssignedPartnersState();
}

class _AssignedPartnersState extends State<AssignedPartners> {
  late List<Partner> partners;

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
    PartnersTable partnersTable = PartnersTable();
    partners =
        await partnersTable.getPartners(partnerIDs: widget.assignedPartners);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Juan Perez",
          style: TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyTheme.background,
      ),
      backgroundColor: MyTheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20.0),
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
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    partnerContainer(partner: partners[index]),
                itemCount: partners.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget partnerContainer({required Partner partner}) => Stack(
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
