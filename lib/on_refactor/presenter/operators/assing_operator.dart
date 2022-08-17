import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vote_observers/on_refactor/data/counters_table.dart';
import 'package:vote_observers/on_refactor/data/operators_table.dart';
import 'package:vote_observers/on_refactor/data/partners_table.dart';
import 'package:vote_observers/on_refactor/domain/models/partner.dart';
import 'package:vote_observers/on_refactor/presenter/operators/operatorsList/operators_provider.dart';
import 'package:vote_observers/on_refactor/presenter/partners/partner_consults.dart';
import 'package:vote_observers/on_refactor/presenter/widgets/my_button.dart';
import 'package:vote_observers/on_refactor/presenter/widgets/my_text_field.dart';
import 'package:vote_observers/src/my_theme.dart';
import 'package:vote_observers/on_refactor/domain/models/operator.dart';

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

  static Operator? operator;
  static late Partner partner;

  static final _formKey = GlobalKey<FormState>();

  ConsultType _consultType = ConsultType.partnerId;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getOperator();
  }

  Future<void> getOperator() async {
    setState(() {
      _isLoading = true;
    });

    final getOperator = await operatorsTable.getOperator(
        operatorID: widget.operatorIdentification);
    setState(() {
      operator = getOperator;
      _isLoading = false;
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
        child: (_isLoading) ? const Center(child: CircularProgressIndicator(color: MyTheme.darkGreen,),) : Column(
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
                            child: Text(operator!.identification.toString()),
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
                            child: Text(operator!.name),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                      size: 36,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: ConsultType.partnerId,
                                    groupValue: _consultType,
                                    activeColor: MyTheme.darkGreen,
                                    onChanged: (ConsultType? value) {
                                      setState(() {
                                        _consultType = value!;
                                      });

                                      clearPartnerFields();
                                    }),
                                const Text("Nro Socio"),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: ConsultType.identification,
                                    groupValue: _consultType,
                                    activeColor: MyTheme.darkGreen,
                                    onChanged: (ConsultType? value) {
                                      setState(() {
                                        _consultType = value!;
                                      });

                                      clearPartnerFields();
                                    }),
                                const Text("Nro Cédula"),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextField(
                                hintText:
                                    (_consultType == ConsultType.identification)
                                        ? "Cédula de identidad del socio"
                                        : "Número de socio",
                                textEditingController: partnerSearchController,
                                textInputType: TextInputType.number,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: CircleAvatar(
                                backgroundColor: MyTheme.primaryColor,
                                child: IconButton(
                                  onPressed: () async {
                                    bool _isPartnerAlreadyExist = false;

                                    if (_consultType ==
                                        ConsultType.identification) {
                                      _isPartnerAlreadyExist =
                                          await partnersTable.isPartnerExist(
                                              partnerSearchController.text);
                                    } else {
                                      Partner? partner =
                                          await partnersTable.getPartnerById(
                                              partnerId: int.parse(
                                                  partnerSearchController
                                                      .text));

                                      if (partner != null) {
                                        _isPartnerAlreadyExist = true;
                                      }
                                    }

                                    if (_isPartnerAlreadyExist) {
                                      if(_consultType == ConsultType.identification){
                                        partner = await partnersTable.getPartner(
                                            partnerIdentification:
                                            partnerSearchController.text);
                                      }else{
                                        partner = (await partnersTable.getPartnerById(partnerId: int.parse(partnerSearchController.text)))!;
                                      }

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
                          height: 20.0,
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
                    }
                    else {
                      //get actual assigned partners list
                      List<dynamic> assignedPartners =
                          operator!.assignedPartners;
                      //add new assigned partner
                      assignedPartners.add(partner.partnerIdentification.toString());

                      //add new partner to operator local object
                      operator!.assignedPartners = assignedPartners;
                      //update assigned quantity in local operator object
                      operator!.assignedQuantity = operator!.assignedQuantity + 1;

                      //update operator on database
                      final bool _isAssigned =
                          await operatorsTable.createOperator(
                              operator: operator!,
                              operatorID: operator!.identification.toString());

                      if (_isAssigned) {
                        //update partner phone
                        partner.phone = partnerPhoneController.text;
                        //update assigned state on partner local object
                        partner.assigned = true;
                        //update operator identification on partner local object
                        partner.operatorIdentification =
                            operator!.identification;
                        //update operator name on partner local object
                        partner.operatorName = operator!.name;
                        //update partner on database
                        final bool _isStateChanged =
                            await partnersTable.addPartner(
                                partner: partner,
                                partnerID: partner.partnerIdentification.toString());

                        if (_isStateChanged) {
                          //update counter
                          await countersTable.incrementCounter(
                              docID: "partners_assigned");

                          await Provider.of<OperatorsProvider>(context,
                                  listen: false)
                              .initializeOperatorsData();

                          await Provider.of<OperatorsProvider>(context,
                                  listen: false)
                              .setAssignedPartners(
                                  newAssignedPartners:
                                      operator!.assignedPartners);

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
