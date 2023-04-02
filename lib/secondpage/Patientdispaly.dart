import 'package:flutter/material.dart';
import './ButtonPage.dart';
import './PatientDetail.dart';
import '../farstpage/Setuppage.dart';
import '../globledata.dart';
import '../setupfunctions/disconnect.dart';
import './setupbtn.dart';

class Patientdispaly extends StatefulWidget {
  const Patientdispaly({Key? key}) : super(key: key);

  @override
  _PatientdispalyState createState() => _PatientdispalyState();
}

class _PatientdispalyState extends State<Patientdispaly> {
  // late Timer timer;

  @override
  void initState() {
    loadGlobalData();
    super.initState();
  }

  @override
  void dispose() {
    saveDataBeforeAppClose();
    rundisconnect();
    super.dispose();
  }

  void moveSetup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Setuppage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(240, 102, 153, 204),
      appBar: AppBar(
        title: const Text('Patient info'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: PatientDetail(deviceId: 1),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: PatientDetail(deviceId: 2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: Button(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 8),
              child: SetupBtn(onPressed: moveSetup),
            ),
          ],
        ),
      ),
    );
  }
}
