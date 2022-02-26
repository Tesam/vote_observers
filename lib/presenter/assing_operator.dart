import 'package:flutter/material.dart';
import 'package:vote_observers/data/partners_table.dart';
import 'package:vote_observers/domain/models/partner.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/widgets/my_button.dart';
import 'package:vote_observers/presenter/widgets/my_text_field.dart';

class AssignOperator extends StatelessWidget {
  const AssignOperator({Key? key}) : super(key: key);
  static PartnersTable partnersTable = PartnersTable();

  static TextEditingController operatorSearchController = TextEditingController();
  static TextEditingController operatorNameController = TextEditingController();
  static TextEditingController partnerSearchController = TextEditingController();
  static TextEditingController partnerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Asignar operador",
          style: TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyTheme.background,
      ),
      backgroundColor: MyTheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyTextField(
                                hintText: "Nro de socio del operador", textEditingController: operatorSearchController,),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: CircleAvatar(
                              backgroundColor: MyTheme.primaryColor,
                              child: IconButton(
                                onPressed: () async {
                                  final Partner partner = await partnersTable.getPartner(partnerID:operatorSearchController.text);
                                  operatorNameController.text = partner.name;
                                },
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
                      const SizedBox(height: 10,),
                      MyTextField(
                          hintText: "Nombre",
                          textFieldStatus: TextFieldStatus.disabled, textEditingController: operatorNameController,),
                    ],
                  ),
                  const Icon(Icons.arrow_downward, color: Colors.black, size: 36,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyTextField(hintText: "Nro de socio", textEditingController: partnerSearchController,),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: CircleAvatar(
                              backgroundColor: MyTheme.primaryColor,
                              child: IconButton(
                                onPressed: () async {
                                  final Partner partner = await partnersTable.getPartner(partnerID:partnerSearchController.text);
                                  partnerNameController.text = partner.name;
                                },
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
                      MyTextField(
                          hintText: "Nombre",
                          textFieldStatus: TextFieldStatus.disabled, textEditingController: partnerNameController,),
                    ],
                  )
                ],
              ),
            ),
            MyButton(title: "Asignar operador", onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
