import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vote_observers/data/counters_table.dart';
import 'package:vote_observers/data/operators_table.dart';
import 'package:vote_observers/data/partners_table.dart';
import 'package:vote_observers/domain/models/operator.dart';
import 'package:vote_observers/domain/models/partner.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/operators/operatorsList/operators_provider.dart';
import 'package:vote_observers/presenter/widgets/my_button.dart';
import 'package:vote_observers/presenter/widgets/my_text_field.dart';

class AssignOperator extends StatefulWidget {
  final String operatorIdentification;

  const AssignOperator({Key? key, required this.operatorIdentification})
      : super(key: key);

  @override
  _AssignOperatorState createState() => _AssignOperatorState();
}

class _AssignOperatorState extends State<AssignOperator> {
  static PartnersTable partnersTable = PartnersTable();
  static OperatorsTable operatorsTable = OperatorsTable();
  static CountersTable countersTable = CountersTable();

  static TextEditingController operatorSearchController =
      TextEditingController();
  static TextEditingController operatorNameController = TextEditingController();
  static TextEditingController partnerSearchController =
      TextEditingController();
  static TextEditingController partnerNameController = TextEditingController();
  static TextEditingController partnerPhoneController = TextEditingController();

  static late Operator operator;
  static late Partner partner;

  static final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getOperator();
  }

  Future<void> getOperator() async {
    final getOperator = await operatorsTable.getOperator(
        operatorID: widget.operatorIdentification);
    setState(() {
      operator = getOperator;
    });
  }

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            clearPartnerFields();
            clearOperatorFields();
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: MyTheme.background,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: MyTheme.grayBackground,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(operator.identification.toString()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: MyTheme.grayBackground,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(operator.name),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    const Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                      size: 36,
                    ),
                    const SizedBox(height: 30,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MyTextField(
                                hintText: "Nro de CI del socio",
                                textEditingController: partnerSearchController,
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return 'Campo requerido';
                                    }
                                  }

                                  if (operatorSearchController.text ==
                                      partnerSearchController.text) {
                                    return 'Operador y socio no pueden ser iguales';
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
                                          partnerIdentification:
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
                                              color: Colors.black,
                                              fontSize: 16),
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        MyTextField(
                          hintText: "Celular",
                          textEditingController: partnerPhoneController,
                        )
                      ],
                    ),
                  ],
                ),
              )),
            ),
            MyButton(
                title: "Asignar operador",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    //detect if the partner is already assigned
                    if (partner.assigned) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'El socio ya cuenta con operador, por favor elige otro socio',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        duration: Duration(seconds: 3),
                        backgroundColor: MyTheme.redColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      ));
                    } else {
                      //get actual assigned partners list
                      List<dynamic> assignedPartners =
                          operator.assignedPartners;
                      //add new assigned partner
                      assignedPartners.add(partnerSearchController.text);

                      //add new partner to operator local object
                      operator.assignedPartners = assignedPartners;
                      //update assigned quantity in local operator object
                      operator.assignedQuantity = operator.assignedQuantity + 1;

                      //update operator on database
                      final bool _isAssigned =
                          await operatorsTable.createOperator(
                              operator: operator,
                              operatorID: operator.identification.toString());

                      if (_isAssigned) {
                        //update partner phone
                        partner.phone = partnerPhoneController.text;
                        //update assigned state on partner local object
                        partner.assigned = true;
                        //update operator identification on partner local object
                        partner.operatorIdentification =
                            operator.identification;
                        //update operator name on partner local object
                        partner.operatorName = operator.name;
                        //update partner on database
                        final bool _isStateChanged =
                            await partnersTable.addPartner(
                                partner: partner,
                                partnerID: partnerSearchController.text);

                        if (_isStateChanged) {
                          //update counter
                          countersTable.incrementCounter(
                              docID: "partners_assigned");

                          await Provider.of<OperatorsProvider>(context,
                                  listen: false)
                              .initializeOperatorsData();
                          await Provider.of<OperatorsProvider>(context,
                                  listen: false)
                              .setAssignedPartners(
                                  newAssignedPartners:
                                      operator.assignedPartners);

                          Navigator.of(context).pop();

                          Future.delayed(const Duration(seconds: 3));

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'El socio se asignó correctamente',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            duration: Duration(seconds: 3),
                            backgroundColor: MyTheme.primaryColor,
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                          ));

                          clearPartnerFields();
                        }
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Error al intentar asignar socio',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: MyTheme.redColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                        ));
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Por favor, rellena los campos obligatorios correctamente',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      duration: Duration(seconds: 3),
                      backgroundColor: MyTheme.redColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
    partnerPhoneController.text = "";
  }
}
