import 'package:flutter/material.dart';
import 'package:vote_observers/on_refactor/data/partners_table.dart';
import 'package:vote_observers/on_refactor/domain/models/partner.dart';
import 'package:vote_observers/on_refactor/presenter/utils.dart';
import 'package:vote_observers/on_refactor/presenter/widgets/my_text_field.dart';
import 'package:vote_observers/src/my_theme.dart';

enum ConsultType { partnerId, identification }

class PartnerConsults extends StatefulWidget {
  const PartnerConsults({Key? key}) : super(key: key);

  @override
  _PartnerConsultsState createState() => _PartnerConsultsState();
}

class _PartnerConsultsState extends State<PartnerConsults> {
  final TextEditingController searchController = TextEditingController();
  ConsultType _consultType = ConsultType.partnerId;
  PartnersTable partnersTable = PartnersTable();
  Partner? _partner;

  bool _isLoading = false;

  void getPartnerByIdentification({required int partnerIdentification}) async {
    setState(() {
      _isLoading = true;
    });
    final Partner? partner = await partnersTable.getPartnerByIdentification(
        partnerIdentification: partnerIdentification);
    setState(() {
      _partner = partner;
      _isLoading = false;
    });
  }

  void getPartnerByPartnerId({required int partnerId}) async {
    setState(() {
      _isLoading = true;
    });
    final Partner? partner =
        await partnersTable.getPartnerById(partnerId: partnerId);
    setState(() {
      _partner = partner;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Consultas",
          style: TextStyle(color: MyTheme.gray2Text),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: MyTheme.background,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: MyTheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
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
                            _partner = null;
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
                            _partner = null;
                            searchController.text = "";
                          });
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
                    hintText: (_consultType == ConsultType.identification)
                        ? "Cédula de identidad del socio"
                        : "Número de socio",
                    textEditingController: searchController,
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          _partner = null;
                        });
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    backgroundColor: MyTheme.primaryColor,
                    child: IconButton(
                      onPressed: () {
                        if (_consultType == ConsultType.identification) {
                          getPartnerByIdentification(
                              partnerIdentification:
                                  int.parse(searchController.text));
                        } else {
                          getPartnerByPartnerId(
                              partnerId: int.parse(searchController.text));
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
              height: 30,
            ),
            (_isLoading)
                ? const CircularProgressIndicator(
                    color: MyTheme.darkGreen,
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: InkWell(
                        child:  Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.all(20),
                              child: (_partner != null)
                                  ? Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    _partner!.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        color: MyTheme.gray2Text,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _partner!.city,
                                    style: const TextStyle(
                                        fontSize: 12.0,
                                        color: MyTheme.gray2Text,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _partner!.phone,
                                    style: const TextStyle(
                                        fontSize: 17.0,
                                        color: MyTheme.gray2Text,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    "Socio",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: MyTheme.gray2Text,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    _partner!.partnerId.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        color: MyTheme.gray3Text,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "Cédula",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: MyTheme.gray2Text,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    _partner!.partnerIdentification
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        color: MyTheme.gray3Text,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Mesa ${_partner!.tableNumber}",
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        color: MyTheme.gray2Text,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Orden ${_partner!.tableOrder}",
                                    style: const TextStyle(
                                        fontSize: 17.0,
                                        color: MyTheme.gray2Text,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    (_partner!.operatorName.isNotEmpty)
                                        ? "Operador"
                                        : "",
                                    style: const TextStyle(
                                        fontSize: 14.0,
                                        color: MyTheme.gray2Text,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    (_partner!.operatorName.isNotEmpty)
                                        ? _partner!.operatorName
                                        : "SIN OPERADOR",
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        color: MyTheme.gray2Text,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                                  : const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 30),
                                  child: Text(
                                    "Selecciona un Socio escribiendo un Número de Cédula o Número de Socio VALIDO",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: MyTheme.gray4Text),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: (_partner != null)
                                  ? (_partner!.voteState)
                                  ? MyTheme.primaryColor
                                  : MyTheme.redColor
                                  : MyTheme.darkYellow,
                              radius: 10,
                            ),
                          ],
                          alignment: const Alignment(0.8, -0.9),
                        ),
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              "Llamar",
                              style: TextStyle(color: MyTheme.darkGreen),
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            content: SingleChildScrollView(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Desea llamar al socio ',
                                  style: TextStyle(color: MyTheme.gray2Text),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: _partner!.name,
                                        style: const TextStyle(fontWeight: FontWeight.bold)),
                                    const TextSpan(text: '?'),
                                  ],
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(color: MyTheme.gray2Text),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  'Llamar',
                                  style: TextStyle(color: MyTheme.darkGreen),
                                ),
                                onPressed: () {
                                  (_partner!.phone.isEmpty)
                                      ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text(
                                      'Número de teléfono NO asignado',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: MyTheme.redColor,
                                    padding:
                                    EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  ))
                                      : makePhoneCall('tel:${_partner!.phone}');
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}


