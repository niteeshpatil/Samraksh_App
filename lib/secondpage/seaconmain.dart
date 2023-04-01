import 'dart:async';
import 'package:flutter/material.dart';
import './ButtonPage.dart';
import './PatientDetail.dart';
import '../data.dart';
import '../farstpage/my_app.dart';
import '../globledata.dart';
import '../setupfunctions/disconnect.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    saveDataBeforeAppClose();
    rundisconnect();
    super.dispose();
  }

  void checkIsset() {
    if (isset == 0) {
      rundisconnect();
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      timer.cancel();
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      checkIsset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(240, 102, 153, 204),
        appBar: AppBar(
          title: const Text('Patient info'),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Expanded(flex: 2, child: PatientDetail()),
            Expanded(flex: 1, child: Button()),
          ],
        ),
      ),
    );
  }
}
