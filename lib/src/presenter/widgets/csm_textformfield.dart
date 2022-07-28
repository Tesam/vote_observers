import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class CSMTextFormField extends StatefulWidget {
  const CSMTextFormField(
      {Key? key, required this.hintText, this.isPassword = false,})
      : super(key: key);
  final String hintText;
  final bool isPassword;

  @override
  _CSMTextFormFieldState createState() => _CSMTextFormFieldState();
}

class _CSMTextFormFieldState extends State<CSMTextFormField> {
  bool isTextVisible = false;

  void toggleTextVisibility(){
    setState(() {
      isTextVisible = !isTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (widget.isPassword) ? !isTextVisible : false,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: MyTheme.kBackground, width: 2,),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
            padding: const EdgeInsets.only(right: 5.0),
            icon: Icon(
              isTextVisible ? Icons.visibility : Icons.visibility_off,
              color: MyTheme.kBackground,
              size: 18,
            ),
            onPressed: () => toggleTextVisibility(),
          )
              : null,
          suffixIconColor: MyTheme.kBackground,
          hintText: widget.hintText,


      ),
    );
  }
}
