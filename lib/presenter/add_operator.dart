import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/widgets/my_button.dart';
import 'package:vote_observers/presenter/widgets/my_text_field.dart';

class AddOperator extends StatelessWidget {
  const AddOperator({Key? key}) : super(key: key);

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
                      const Expanded(
                        child: MyTextField(hintText: "Nro de socio del operador"),
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
                    height: 20.0,
                  ),
                  const MyTextField(hintText: "Nombre", textFieldStatus: TextFieldStatus.disabled),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const MyTextField(hintText: "Celular")
                ],
              ),
            ),
            myButton(title: "Crear operador"),
          ],
        ),
      ),
    );
  }
}
