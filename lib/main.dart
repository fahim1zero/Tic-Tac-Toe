// ignore_for_file: prefer_const_literals_to_create_immutables,
// ignore_for_file: prefer_const_constructors,
// ignore_for_file: non_constant_identifier_names,
// ignore_for_file: use_key_in_widget_constructors,
// ignore_for_file: sized_box_for_whitespace,
// ignore_for_file: prefer_typing_uninitialized_variables,

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home_page.dart';

void main() {
  runApp(MyApp());
}

bool darkMode = true;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
