import 'package:flutter/material.dart';
import 'package:vote_observers/data/counters_table.dart';
import 'package:vote_observers/data/operators_table.dart';
import 'package:vote_observers/data/partners_table.dart';
import 'package:vote_observers/domain/models/operator.dart';
import 'package:vote_observers/domain/models/partner.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/widgets/my_button.dart';
import 'package:vote_observers/presenter/widgets/my_text_field.dart';

class AddOperator extends StatelessWidget {
  const AddOperator({Key? key}) : super(key: key);
  static PartnersTable partnersTable = PartnersTable();
  static OperatorsTable operatorsTable = OperatorsTable();
  static CountersTable countersTable = CountersTable();

  static TextEditingController searchController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();

  static late Partner operator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Crear operador",
          style: TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyTheme.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            clearOperatorFields();
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: MyTheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                          hintText: "Nro de CI del operador",
                          textEditingController: searchController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: CircleAvatar(
                          backgroundColor: MyTheme.primaryColor,
                          child: IconButton(
                            onPressed: () async {
                              final bool _isOperatorAlreadyExist =
                                  await partnersTable
                                      .isPartnerExist(searchController.text);

                              if (!_isOperatorAlreadyExist) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    'El identificador no existe, por favor intente con otro',
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
                              else {
                                operator = await partnersTable.getPartner(
                                    partnerIdentification: searchController.text);
                                nameController.text = operator.name;
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
                    height: 20.0,
                  ),
                  MyTextField(
                    hintText: "Nombre",
                    textFieldStatus: TextFieldStatus.disabled,
                    textEditingController: nameController,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  MyTextField(
                    hintText: "Celular",
                    textEditingController: phoneController,
                  )
                ],
              ),
            ),
            MyButton(
                title: "Crear operador",
                onPressed: () async {
                  final bool _isOperatorAlreadyExist = await operatorsTable
                      .isOperatorExist(searchController.text);

                  if (_isOperatorAlreadyExist) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'El Operador ya existe',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      duration: Duration(seconds: 3),
                      backgroundColor: MyTheme.redColor,
                      padding: EdgeInsets.symmetric(vertical: 40),
                    ));
                  } else {
                    bool _isAdded = await operatorsTable.createOperator(
                        operator: Operator(
                          name: operator.name,
                          phone: phoneController.text,
                          identification: operator.partnerIdentification,
                          assignedPartners: [],
                          partnerId: operator.partnerId
                        ),
                        operatorID: searchController.text);

                    if(_isAdded){
                      //update counter
                      countersTable.incrementCounter(docID: "operators");
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text(
                          'El Operador se agregó correctamente',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        duration: Duration(seconds: 3),
                        backgroundColor: MyTheme.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 40),
                      ));

                    }else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text(
                          'Error al intentar agregar operador',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        duration: Duration(seconds: 3),
                        backgroundColor: MyTheme.redColor,
                        padding: EdgeInsets.symmetric(vertical: 40),
                      ));
                    }
                  }
                  clearOperatorFields();
                }),
          ],
        ),
      ),
    );
  }

  void clearOperatorFields() {
    searchController.text = "";
    nameController.text = "";
    phoneController.text = "";
  }
}
