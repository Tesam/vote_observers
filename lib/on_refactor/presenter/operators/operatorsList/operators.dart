import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vote_observers/on_refactor/domain/models/operator.dart';
import 'package:vote_observers/on_refactor/presenter/operators/add_operator.dart';
import 'package:vote_observers/on_refactor/presenter/operators/assigned_partners.dart';
import 'package:vote_observers/on_refactor/presenter/operators/operatorsList/operators_provider.dart';
import 'package:vote_observers/on_refactor/presenter/partners/partner_consults.dart';
import 'package:vote_observers/on_refactor/presenter/widgets/my_text_field.dart';
import 'package:vote_observers/src/my_theme.dart';

class Operators extends StatefulWidget {
  const Operators({Key? key}) : super(key: key);

  @override
  _OperatorsState createState() => _OperatorsState();
}

class _OperatorsState extends State<Operators> {
  final TextEditingController searchController = TextEditingController();
  String searchValue = "";
  int? operatorsCount;
  int? partnersAssignedCount;

  ConsultType _consultType = ConsultType.partnerId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Operadores",
          style: TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(
                                builder: (context) => const PartnerConsults()),
                      );
                    },
                    title: const Text(
                      "Consultas",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  value: 2,
                ),
              ]),
        ],
        elevation: 0,
        backgroundColor: MyTheme.background,
      ),
      backgroundColor: MyTheme.background,
      body: Consumer<OperatorsProvider>(
          builder: (_, provider, __) => RefreshIndicator(
              color: MyTheme.darkGreen,
              child: (provider.isLoading)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: MyTheme.darkGreen,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                                          searchValue = "";
                                          searchController.text = "";
                                        });
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
                                          searchValue = "";
                                          searchController.text = "";
                                        });
                                      }),
                                  const Text("Nro C??dula"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MyTextField(
                                  hintText: (_consultType ==
                                          ConsultType.identification)
                                      ? "C??dula de identidad del socio"
                                      : "N??mero de socio",
                                  textEditingController: searchController,
                                  textInputType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      updateSearchValue(newValue: value);
                                    }
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: CircleAvatar(
                                  backgroundColor: MyTheme.primaryColor,
                                  child: IconButton(
                                    onPressed: () => updateSearchValue(
                                        newValue: searchController.text),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: MyTheme.primary100),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "${provider.operatorsCount} Operadores creados",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: MyTheme.darkGreen,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: MyTheme.lightYellow),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "${provider.partnersAssignedCount} Socios asignados",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: MyTheme.darkYellow,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Expanded(
                            child: (provider.operatorList.isNotEmpty)
                                ? ListView.builder(
                                    itemBuilder: (context, index) {
                                      if(_consultType == ConsultType.identification){
                                        if (provider.operatorList[index]
                                            .identification
                                            .toString() ==
                                            searchValue ||
                                            searchValue.isEmpty) {
                                          return operatorContainer(
                                              context: context,
                                              operator:
                                              provider.operatorList[index]);
                                        } else {
                                          return Container();
                                        }
                                      }else{
                                        if (provider.operatorList[index]
                                            .partnerId
                                            .toString() ==
                                            searchValue ||
                                            searchValue.isEmpty) {
                                          return operatorContainer(
                                              context: context,
                                              operator:
                                              provider.operatorList[index]);
                                        } else {
                                          return Container();
                                        }
                                      }

                                    },
                                    itemCount: provider.operatorList.length,
                                  )
                                : const Center(
                                    child: Text(
                                      "No hay operadores creados",
                                      style: TextStyle(
                                          color: MyTheme.gray3Text,
                                          fontSize: 18),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
              onRefresh: () => provider.initializeOperatorsData())),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AddOperator()),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: MyTheme.primaryColor,
      ),
    );
  }

  Widget operatorContainer(
          {required BuildContext context, required Operator operator}) =>
      InkWell(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                operator.name,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: MyTheme.gray2Text,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                operator.phone,
                style: const TextStyle(
                    fontSize: 12.0,
                    color: MyTheme.gray3Text,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${operator.assignedQuantity} asignados',
                    style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  TextButton(
                    child: const Text(
                      "Ver asignados",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Provider.of<OperatorsProvider>(context, listen: false)
                          .setCurrentOperator(
                        operatorIdentification:
                            operator.identification.toString(),
                      );

                      Provider.of<OperatorsProvider>(context, listen: false)
                          .setAssignedPartners(
                              newAssignedPartners: operator.assignedPartners);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AssignedPartners(
                            currentOperatorName: operator.name,
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        onTap: () async {
          await Provider.of<OperatorsProvider>(context, listen: false)
              .setCurrentOperator(
            operatorIdentification: operator.identification.toString(),
          );

          print("ASSIGNED: ${operator.assignedPartners}");
          await Provider.of<OperatorsProvider>(context, listen: false)
              .setAssignedPartners(
                  newAssignedPartners: operator.assignedPartners);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AssignedPartners(
                  currentOperatorName: operator.name,
                ),
              ));
        },
      );

  void updateSearchValue({required String newValue}) {
    setState(() {
      searchValue = newValue;
    });
  }
}
