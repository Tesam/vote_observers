import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

enum TextFieldStatus { enabled, disabled }
enum TextFieldType { search, password, normal }

class MyTextField extends StatefulWidget {
  final TextFieldStatus textFieldStatus;
  final TextFieldType textFieldType;
  final String hintText;

  const MyTextField(
      {Key? key,
      this.textFieldStatus = TextFieldStatus.enabled,
      this.textFieldType = TextFieldType.normal, required this.hintText})
      : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late FocusNode myFocusNode;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      setState(() {
        hasFocus = myFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: (widget.textFieldStatus == TextFieldStatus.enabled)
            ? Colors.white
            : MyTheme.grayBackground,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText,
        enabled: (widget.textFieldStatus == TextFieldStatus.enabled) ? true : false,
        filled: true,
        labelStyle: TextStyle(
            color: hasFocus
                ? MyTheme.gray3Text
                : MyTheme.gray4Text,
            fontSize: 15,
            fontWeight: hasFocus ? FontWeight.w600 : FontWeight.normal),
      ),
      cursorColor: MyTheme.darkGreen,
      obscureText: (widget.textFieldType == TextFieldType.password) ? true : false,
    );
  }
}
