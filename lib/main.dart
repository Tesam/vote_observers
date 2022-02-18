import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/voter_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vote Observers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VoterList(),
    );
  }
}

