import 'package:flutter/material.dart';
import 'package:vote_observers/data/operators_table.dart';
import 'package:vote_observers/data/partners_table.dart';
import 'package:vote_observers/domain/models/operator.dart';
import 'package:vote_observers/domain/models/partner.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/widgets/my_button.dart';
import 'package:vote_observers/presenter/widgets/my_text_field.dart';

class AssignOperator extends StatelessWidget {
  const AssignOperator({Key? key}) : super(key: key);
  static PartnersTable partnersTable = PartnersTable();
  static OperatorsTable operatorsTable = OperatorsTable();

  static TextEditingController operatorSearchController =
      TextEditingController();
  static TextEditingController operatorNameController = TextEditingController();
  static TextEditingController partnerSearchController =
      TextEditingController();
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
                              hintText: "Nro de socio del operador",
                              textEditingController: operatorSearchController,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: CircleAvatar(
                              backgroundColor: MyTheme.primaryColor,
                              child: IconButton(
                                onPressed: () async {
                                  final bool _isOperatorAlreadyExist =
                                      await operatorsTable.isOperatorExist(
                                          operatorSearchController.text);

                                  if (_isOperatorAlreadyExist) {
                                    final Operator operator =
                                        await operatorsTable.getOperator(
                                            operatorID:
                                                operatorSearchController.text);
                                    operatorNameController.text = operator.name;
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                        'El Operador no existe, por favor elige otro identificador',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: MyTheme.redColor,
                                      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                    ));
                                  }

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
                        height: 10,
                      ),
                      MyTextField(
                        hintText: "Nombre",
                        textFieldStatus: TextFieldStatus.disabled,
                        textEditingController: operatorNameController,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_downward,
                    color: Colors.black,
                    size: 36,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyTextField(
                              hintText: "Nro de socio",
                              textEditingController: partnerSearchController,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: CircleAvatar(
                              backgroundColor: MyTheme.primaryColor,
                              child: IconButton(
                                onPressed: () async {
                                  final bool _isPartnerAlreadyExist =
                                  await partnersTable.isPartnerExist(
                                      partnerSearchController.text);

                                  if (_isPartnerAlreadyExist) {
                                    final Partner partner =
                                    await partnersTable.getPartner(
                                        partnerID:
                                        partnerSearchController.text);
                                    partnerNameController.text = partner.name;
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                        'El Socio no existe, por favor elige otro identificador',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: MyTheme.redColor,
                                      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                    ));
                                  }


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
                        textFieldStatus: TextFieldStatus.disabled,
                        textEditingController: partnerNameController,
                      ),
                    ],
                  )
                ],
              ),
            ),
            MyButton(
                title: "Asignar operador",
                onPressed: () {
                  //get assigned list

                  //add new assigned partner

                  //update operator document
                }),
          ],
        ),
      ),
    );
  }
}
