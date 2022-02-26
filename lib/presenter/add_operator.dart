import 'package:flutter/material.dart';
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
                          hintText: "Nro de socio del operador",
                          textEditingController: searchController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: CircleAvatar(
                          backgroundColor: MyTheme.primaryColor,
                          child: IconButton(
                            onPressed: () async {
                              operator = await partnersTable.getPartner(
                                  partnerID: searchController.text);
                              nameController.text = operator.name;
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
                  bool _isAdded = await operatorsTable.createOperator(
                      operator: Operator(
                          name: operator.name,
                          phone: phoneController.text,
                          identification: operator.identification,
                          assignedPartners: []),
                      operatorID: searchController.text);

                  (_isAdded)
                      ? ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text(
                            'El Operador se agregó correctamente',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: MyTheme.primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 40),
                        ))
                      : ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                    content: Text(
                      'Error al intentar agregar operador',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    duration: Duration(seconds: 3),
                    backgroundColor: MyTheme.redColor,
                    padding: EdgeInsets.symmetric(vertical: 40),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
