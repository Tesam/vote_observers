import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/widgets/my_button.dart';
import 'package:vote_observers/presenter/widgets/my_text_field.dart';

class AssignOperator extends StatelessWidget {
  const AssignOperator({Key? key}) : super(key: key);

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
                          const Expanded(
                            child: MyTextField(
                                hintText: "Nro de socio del operador"),
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
                      const SizedBox(height: 10,),
                      const MyTextField(
                          hintText: "Nombre",
                          textFieldStatus: TextFieldStatus.disabled),
                    ],
                  ),
                  const Icon(Icons.arrow_downward, color: Colors.black, size: 36,),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: MyTextField(hintText: "Nro de socio"),
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
                        height: 10.0,
                      ),
                      const MyTextField(
                          hintText: "Nombre",
                          textFieldStatus: TextFieldStatus.disabled),
                    ],
                  )
                ],
              ),
            ),
            myButton(title: "Asignar operador"),
          ],
        ),
      ),
    );
  }
}
