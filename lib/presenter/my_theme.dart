import 'package:flutter/material.dart';

class MyTheme {
  static const darkGreen = Color(0xFF1D8233);
  static const primaryColor = Color(0xFFBCEEA5);
  static const primary100 = Color(0xFFE9F3E4);
  static const darkYellow = Color(0xFFD3CC12);
  static const lightYellow = Color(0xFFFFFEE5);
  static const redColor = Color(0xFFFF8C8C);
  static const darkBlue = Color(0xFF596AFF);
  static const lightBlue = Color(0xFFE5E8FF);
  static const grayBackground = Color(0xFFE5E5E5);
  static const gray2Text = Color(0xFF4F4F4F);
  static const gray3Text = Color(0xFF828282);
  static const gray4Text = Color(0xFFBDBDBD);
  static const background = Color(0xFFF6F6F6);

  //new themes
  static const kBackground = Color(0xFF364F6B);
  static const kPrimaryColor = Color(0xFF43DDE6);
  static const kSecondaryColor = Color(0xFFFC5185);
  static const kLightColor = Color(0xFFF0F0F0);
  static const kYellowColor = Color(0xFFFFeB3B);

  static const kFontFamily = 'Nunito';

  static ThemeData getTheme({required Size size}) {
    return lightThemeData.copyWith(
      textTheme: textThemeMobile,
      primaryColor: primaryColor,
    );
  }

  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: MyTheme.primaryColor,
    ),
  );

  static TextTheme textThemeMobile = const TextTheme(
    headline1: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w800,
      color: primaryColor,
      fontFamily: kFontFamily,
    ),
  );
}