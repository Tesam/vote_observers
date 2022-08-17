import 'package:flutter/material.dart';
import 'package:vote_observers/src/my_theme.dart';

class CSMButton extends StatelessWidget {
  const CSMButton.large(
      {Key? key,
      required this.onPressed,
      required this.buttonTitle,
      this.widthPercent = 0.75,
        this.height = 50,
        this.backgroundColor = MyTheme.kPrimaryColor,
        this.textColor = MyTheme.kBackground,
        this.textSize = 17,
        this.textWeight = FontWeight.w700,
      })
      : super(key: key);

  const CSMButton.small(
      {Key? key,
      required this.onPressed,
      required this.buttonTitle,
      required this.widthPercent,
        this.height = 35,
        this.backgroundColor = MyTheme.kPrimaryColor,
        this.textColor = MyTheme.kBackground,
        this.textSize = 14,
        this.textWeight = FontWeight.w600,
      })
      : super(key: key);

  final VoidCallback onPressed;
  final String buttonTitle;
  final double widthPercent;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double textSize;
  final FontWeight textWeight;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * widthPercent,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor, // background
          onPrimary: Colors.white,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontFamily: MyTheme.kFontFamily,
            fontWeight: textWeight,
          ),
        ),
      ),
    );
  }
}
