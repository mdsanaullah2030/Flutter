import 'package:capnest/homepage/HomePage.dart';
import 'package:capnest/orderdetailspage/OrderDetailsPage.dart';
import 'package:capnest/productorderpage/ProductOrderPage.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      home:HomePage(

      ),
    );
  }
}