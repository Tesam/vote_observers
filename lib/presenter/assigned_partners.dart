import 'package:flutter/material.dart';
import 'package:vote_observers/data/partners_table.dart';
import 'package:vote_observers/domain/models/partner.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class AssignedPartners extends StatelessWidget {
  final List<dynamic> assignedPartners;
  final String operatorName;

  const AssignedPartners({Key? key, required this.assignedPartners, required this.operatorName})
      : super(key: key);

  static PartnersTable partnersTable = PartnersTable();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          operatorName,
          style: const TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyTheme.background,
      ),
      backgroundColor: MyTheme.background,
      body: FutureBuilder<List<Partner>>(
          future: partnersTable.getPartners(partnerIDs: assignedPartners),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: Column(
                  children: [
                    Row(
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            partnerContainer(partner: snapshot.data![index]),
                        itemCount: snapshot.data!.length,
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Algo salió mal"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(MyTheme.primaryColor),
                ),
              );
            }
          }),
      /*   Padding(
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
      ),*/
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