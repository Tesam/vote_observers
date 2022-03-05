import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

Widget dataSampleWarning() => Container(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: MyTheme.primaryColor)),
      child: const Text(
        "Esta pantalla contiene datos de prueba, los datos reales se podrán observar el día de la votación",
        textAlign: TextAlign.center,
      ),
    );
