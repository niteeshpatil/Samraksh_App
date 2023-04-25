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
      backgroundColor: Color.fromARGB(255, 250, 213, 182),
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              'Samraksh',
              style: TextStyle(
                color: Color.fromARGB(58, 255, 255, 255),
              ),
            ),
            SizedBox(width: 45),
            Text(
              'Patient Info',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(224, 255, 255, 255),
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Color.fromARGB(224, 255, 255, 255),
            ),
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
                  ButtonExpand("Device-1", 0, expandedIndex, () {
                    setState(() {
                      if (expandedIndex == 0) {
                        expandedIndex = 1;
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
                  ButtonExpand("Device-2", 1, expandedIndex, () {
                    setState(() {
                      if (expandedIndex == 1) {
                        expandedIndex = 0;
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
              padding: EdgeInsets.only(
                  top: expandedIndex == -1 ? 435 : 135, bottom: 0),
              child: Button(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: SetupBtn(onPressed: moveSetup),
            ),
          ],
        ),
      ),
    );
  }
}
