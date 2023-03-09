import 'package:api/widgets/agify.dart';
import 'package:api/widgets/boredapi.dart';
import 'package:api/widgets/employee.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: employee(),
    );
  }
}
