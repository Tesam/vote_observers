import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vote_observers/presenter/home.dart';
import 'package:vote_observers/presenter/operators/operatorsList/operators_provider.dart';
import 'package:vote_observers/presenter/operators/operatorsList/operators_provider_2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OperatorsProvider()),
        ChangeNotifierProvider(create: (_) => OperatorsProvider2()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vote Observers',
      home: Home(),
    );
  }
}
