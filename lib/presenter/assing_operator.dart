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

  static late Operator operator;
  static late Partner partner;

  static final _formKey = GlobalKey<FormState>();

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
                child: Form(
              key: _formKey,
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
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return 'Campo requerido';
                                  }
                                }
                                return null;
                              },
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
                                    operator = await operatorsTable.getOperator(
                                        operatorID:
                                            operatorSearchController.text);
                                    operatorNameController.text = operator.name;
                                  } else {
                                    clearOperatorFields();
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 40, horizontal: 20),
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
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return 'Campo requerido';
                            }
                          }
                          return null;
                        },
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
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return 'Campo requerido';
                                  }
                                }
                                return null;
                              },
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
                                    partner = await partnersTable.getPartner(
                                        partnerID:
                                            partnerSearchController.text);
                                    partnerNameController.text = partner.name;
                                  } else {
                                    clearPartnerFields();
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 40, horizontal: 20),
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
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return 'Campo requerido';
                            }
                          }
                          return null;
                        },
                      ),
                    ],
                  )
                ],
              ),
            )),
            MyButton(
                title: "Asignar operador",
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    //get actual assigned partners list
                    List<dynamic> assignedPartners = operator.assignedPartners;

                    //add new assigned partner
                    assignedPartners.add(partnerSearchController.text);

                    //add new partner to operator object
                    operator.assignedPartners = assignedPartners;

                    //update operator on database
                    await operatorsTable.createOperator(
                        operator: operator,
                        operatorID: operatorSearchController.text);
                  }else{
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text(
                        'Por favor, rellena los campos obligatorios',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontSize: 16),
                      ),
                      duration: Duration(seconds: 3),
                      backgroundColor: MyTheme.redColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 40, horizontal: 20),
                    ));
                  }
                }),
          ],
        ),
      ),
    );
  }

  void clearOperatorFields() {
    operatorSearchController.text = "";
    operatorNameController.text = "";
  }

  void clearPartnerFields() {
    partnerSearchController.text = "";
    partnerNameController.text = "";
  }
}
