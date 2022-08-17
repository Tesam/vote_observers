import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/my_theme.dart';
import 'package:vote_observers/src/presenter/home/role_checker.dart';
import 'package:vote_observers/src/presenter/login/auth_user.dart';
import 'package:vote_observers/src/presenter/widgets/csm_button.dart';
import 'package:vote_observers/src/presenter/widgets/csm_textformfield.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    ref.listen<User?>(authUserProvider, (_, user) {
      if (user != null) {
        cleanFields();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RoleChecker(
              user: user,
            ),
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: MyTheme.kLightColor,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: SizedBox(
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
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
              flex: 3,
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.75,
                      child: CSMTextFormField(
                        hintText: "Correo",
                        controller: _emailController,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: size.width * 0.75,
                      child: CSMTextFormField(
                        hintText: "Contraseña",
                        isPassword: true,
                        controller: _passController,
                      ),
                    ),
                  ],
                ),
              ),
              flex: 3,
            ),
            Flexible(
              child: CSMButton.large(
                buttonTitle: "Ingresar",
                onPressed: () async {
                  ref.read(authUserProvider.notifier).signIn(
                        email: _emailController.text,
                        password: _passController.text,
                        context: context,
                      );
                },
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  void cleanFields() {
    _emailController.text = "";
    _passController.text = "";
  }
}
