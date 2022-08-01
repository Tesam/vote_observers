import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class CSMButton extends StatelessWidget {
  const CSMButton({Key? key, required this.onPressed, required this.buttonTitle}) : super(key: key);
  final VoidCallback onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.75,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: MyTheme.kPrimaryColor, // background
          onPrimary: Colors.white,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: const TextStyle(
            color: MyTheme.kBackground,
            fontSize: 17,
            fontFamily: MyTheme.kFontFamily,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
