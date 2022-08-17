import 'package:flutter/material.dart';
import 'package:vote_observers/src/my_theme.dart';

class CSMLoadingScreen extends StatelessWidget {
  const CSMLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyTheme.kBackground,
      body: Center(
        child: CircularProgressIndicator(color: MyTheme.kPrimaryColor,),
      ),
    );
  }
}
