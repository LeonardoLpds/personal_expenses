import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/layout/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despesas Pessoais',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColorLight: Colors.lightBlue.shade300,
      ),
      home: const MainLayout(),
    );
  }
}
