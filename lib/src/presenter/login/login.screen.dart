import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/src/presenter/widgets/csm_button.dart';
import 'package:vote_observers/src/presenter/widgets/csm_textformfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyTheme.kLightColor,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Container(
                  width: size.width * 0.7,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Bienvenido a",
                        style: TextStyle(
                            fontFamily: MyTheme.kFontFamily,
                            fontWeight: FontWeight.w800,
                            color: MyTheme.kBackground,
                            letterSpacing: -1,
                            fontSize: 33),
                      ),
                      Text(
                        "Voting",
                        style: TextStyle(
                            fontFamily: MyTheme.kFontFamily,
                            fontWeight: FontWeight.w800,
                            color: MyTheme.kSecondaryColor,
                            letterSpacing: -1,
                            height: 1,
                            fontSize: 37),
                      ),
                      SizedBox(height: 50,),
                    ],
                  )),
              flex: 3,
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child:   Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.75,
                      child: const CSMTextFormField(hintText: "Correo",),
                    ),
                    const SizedBox(height: 8,),
                    SizedBox(
                      width: size.width * 0.75,
                      child: const CSMTextFormField(hintText: "Contraseña",isPassword: true),
                    ),
                  ],
                ),
              ),
              flex: 3,
            ),
            Flexible(
              child: CSMButton(
                buttonTitle: "Ingresar",
                onPressed: () {},
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
