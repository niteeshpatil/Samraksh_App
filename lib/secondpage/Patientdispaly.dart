import 'package:flutter/material.dart';
import './ButtonPage.dart';
import '../farstpage/Setuppage.dart';
import '../globledata.dart';
import '../setupfunctions/disconnect.dart';
import './setupbtn.dart';
import '../helppage.dart';
import './table/button.dart';
import './table/table.dart';

class Patientdispaly extends StatefulWidget {
  const Patientdispaly({Key? key}) : super(key: key);

  @override
  _PatientdispalyState createState() => _PatientdispalyState();
}

class _PatientdispalyState extends State<Patientdispaly> {
  int expandedIndex = 0;

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
        title: const Text('Patient Info'),
        toolbarHeight: 35,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesDialog(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonExpand("Device 1", 0, expandedIndex, () {
                    setState(() {
                      if (expandedIndex == 0) {
                        expandedIndex = -1;
                      } else {
                        expandedIndex = 0;
                      }
                    });
                  }),
                  PatientDetail(0, expandedIndex),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonExpand("Device 2", 1, expandedIndex, () {
                    setState(() {
                      if (expandedIndex == 1) {
                        expandedIndex = -1;
                      } else {
                        expandedIndex = 1;
                      }
                    });
                  }),
                  PatientDetail(1, expandedIndex),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170, bottom: 0),
              child: Button(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 8),
              child: SetupBtn(onPressed: moveSetup),
            ),
          ],
        ),
      ),
    );
  }
}
