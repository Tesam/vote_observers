import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vote_observers/src/presenter/widgets/csm_button.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CSMButton.large(buttonTitle: "CERRAR SESION", onPressed: () => FirebaseAuth.instance.signOut(),),
      )
    );
  }
}
