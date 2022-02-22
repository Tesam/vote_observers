import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

Widget myButton ({required String title}) {
  return ElevatedButton(
      onPressed: () {},
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          elevation: 0,
          primary: MyTheme.primaryColor,
          minimumSize: const Size(double.infinity, 50)
      ));
}