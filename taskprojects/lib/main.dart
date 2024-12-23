import 'package:flutter/material.dart';
import 'package:taskprojects/DetailScreen.dart';
import 'package:taskprojects/HomeScreen.dart';
import 'package:taskprojects/MenuScreen%20x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:PropertyDetailsPage(

      ),
    );
  }
}


