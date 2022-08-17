import 'package:flutter/material.dart';
import 'package:vote_observers/src/my_theme.dart';

class CSMSnackBar {
  CSMSnackBar.success({required BuildContext context, required String text,}) {
    final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          color: MyTheme.kLightColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: MyTheme.kPrimaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  CSMSnackBar.error({required BuildContext context, required String text,}) {
    final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          color: MyTheme.kLightColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: MyTheme.kSecondaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  CSMSnackBar.warning({required BuildContext context, required String text,}) {
    final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          color: MyTheme.kBackground,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: MyTheme.kYellowColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
