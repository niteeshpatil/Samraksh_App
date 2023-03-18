import 'package:flutter/material.dart';
import 'patient_no.dart';
import 'mode_dropdown.dart';
import 'limit_dropdown.dart';
import 'patient_name.dart';
import 'dart:convert';
import '../setupfunctions/publish.dart';
import '../secondpage/seaconmain.dart';
import '../data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final Patient_Name = TextEditingController();
  final Patient_NO = TextEditingController();

  double? Mode;
  double? dropdownLimitValue;

  @override
  void dispose() {
    Patient_NO.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Samraksh'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(75.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the children vertically
            children: <Widget>[
              Name(controller: Patient_Name),
              const SizedBox(height: 20.0),
              PatientNO(controller: Patient_NO),
              const SizedBox(height: 20.0),
              ModeDropdown(
                  value: Mode,
                  onChanged: (double? newValue) {
                    setState(() {
                      Mode = newValue;
                    });
                  }),
              const SizedBox(height: 20.0),
              // ignore: prefer_const_constructors
              Text(
                'OR',
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(238, 241, 13, 13)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 0.0),
              LimitDropdown(
                  value: dropdownLimitValue,
                  onChanged: (double? newValue) {
                    setState(() {
                      dropdownLimitValue = newValue;
                    });
                  }),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String enteredPatientName = Patient_Name.text;
                    String enteredPatientNo = Patient_NO.text;
                    double? selectedMode = Mode;
                    double? selectedLimit = dropdownLimitValue;
                    print('Name: $enteredPatientName');
                    print('Room_No: $enteredPatientNo');
                    print('Selected_Mode: $selectedMode');
                    print('Selected_limit: $selectedLimit');
                    P_Name = enteredPatientName;
                    P_Room = enteredPatientNo;
                    if (selectedMode != null) {
                      P_Limit = selectedMode;
                    } else {
                      P_Limit = selectedLimit!;
                    }
                    Map<String, dynamic> jsonMessage = {
                      'Name': P_Name,
                      'Room': P_Room,
                      'limit': P_Limit,
                    };

                    String jsonString = json.encode(jsonMessage);
                    print(jsonString);
                    runpublish(jsonString);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.green,
                    textStyle: const TextStyle(fontSize: 15),
                    fixedSize:
                        const Size(120, 40), // set the button width and height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // set the button border radius
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
