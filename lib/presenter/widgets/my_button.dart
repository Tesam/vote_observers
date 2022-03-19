import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  const MyButton({Key? key, required this.title, required this.onPressed, this.color = MyTheme.primaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
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
            primary: color,
            minimumSize: const Size(double.infinity, 50)
        ));
  }
}