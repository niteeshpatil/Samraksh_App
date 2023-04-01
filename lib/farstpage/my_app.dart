import 'package:flutter/material.dart';
import 'home_page.dart';
import '../data.dart';
import '../secondpage/seaconmain.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isset == 0) {
      return const MaterialApp(
        title: 'Setup Up Page',
        home: MyHomePage(),
      );
    } else {
      return const MaterialApp(
        title: 'Patient info',
        home: SecondPage(),
      );
    }
  }
}
