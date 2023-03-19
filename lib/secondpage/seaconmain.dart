import 'package:flutter/material.dart';
import './ButtonPage.dart';
import './PatientDetail.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 199, 199),
        appBar: AppBar(
          title: const Text('Patient info'),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(flex: 2, child: PatientDetail()),
            Expanded(flex: 1, child: Button()),
          ],
        ),
      ),
    );
  }
}
