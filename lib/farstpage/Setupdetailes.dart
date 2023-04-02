import 'dart:async';
import 'package:flutter/material.dart';
import 'patient_no.dart';
import 'mode_dropdown.dart';
import 'limit_dropdown.dart';
import 'patient_name.dart';
import '../setupfunctions/publish.dart';
import '../setupfunctions/subscribe.dart';
import '../secondpage/Patientinfopage.dart';
import '../data.dart';
import '../globledata.dart';
import '../setupfunctions/disconnect.dart';
import './device.dart';
import './patientdetbtn.dart';

class Setupdetailes extends StatefulWidget {
  const Setupdetailes({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SetupdetailesState createState() {
    return _SetupdetailesState();
  }
}

class _SetupdetailesState extends State<Setupdetailes> {
  final Patient_Name = TextEditingController();
  final Patient_NO = TextEditingController();
  double? Mode;
  double? dropdownLimitValue;
  int? device = 1;
  String msg = "";
  bool isLoading = false;
  bool _connectionError = false;
  Timer? _timer;

  void _connect() {
    setState(() {
      isLoading = true;
      _connectionError = false;
    });

    // Simulate a connection delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        _connectionError = true;
        _timer = Timer(Duration(seconds: 1), () {
          setState(() {
            _connectionError = false;
          });
        });
      });
    });
  }

  @override
  void initState() {
    loadDataWhenAppStarts();
    super.initState();
  }

  @override
  void dispose() {
    Patient_NO.dispose();
    rundisconnect();
    _timer?.cancel();
    super.dispose();
  }

  void moveSetup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Patientinfo()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 102, 153, 204),
      appBar: AppBar(
        title: const Text('Samraksh'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the children vertically
            children: <Widget>[
              Name(controller: Patient_Name),
              const SizedBox(height: 20.0),
              PatientNO(controller: Patient_NO),
              const SizedBox(height: 20.0),
              DeviceDropdown(
                  value: device,
                  onChanged: (int? newValue) {
                    setState(() {
                      device = newValue;
                    });
                  }),
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
                    color: Color.fromARGB(255, 0, 0, 0)),
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
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    String enteredPatientName = Patient_Name.text;
                    String enteredPatientNo = Patient_NO.text;
                    int? selectedDevice = device;
                    double? selectedMode = Mode;
                    double? selectedLimit = dropdownLimitValue;
                    // print('Name: $enteredPatientName');
                    // print('Room_No: $enteredPatientNo');
                    // print('Selected_Device: $selectedDevice');
                    // print('Selected_Mode: $selectedMode');
                    // print('Selected_limit: $selectedLimit');

                    if (selectedDevice == 1) {
                      p_name1 = enteredPatientName;
                      p_room1 = enteredPatientNo;
                      if (selectedMode != null) {
                        p_limit1 = selectedMode;
                      } else {
                        p_limit1 = selectedLimit!;
                      }
                      msg = "$device $p_limit1";
                    } else {
                      p_name2 = enteredPatientName;
                      p_room2 = enteredPatientNo;
                      if (selectedMode != null) {
                        p_limit2 = selectedMode;
                      } else {
                        p_limit2 = selectedLimit!;
                      }
                      msg = "$device $p_limit2";
                    }

                    print(msg);
                    isconnected = false;
                    await runpublish(msg);
                    await runsubscribe(4);
                    rundisconnect();

                    setState(() {
                      isLoading = false;
                    });
                    if ((device == 1 && device1isset == 1) ||
                        (device == 2 && device2isset == 1)) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Patientinfo()),
                      );
                    } else {
                      _connect();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 15),
                    fixedSize:
                        const Size(120, 40), // set the button width and height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          12), // set the button border radius
                    ),
                  ),
                  child: isLoading
                      // ignore: prefer_const_constructors
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('Submit'),
                ),
              ),
              if (isLoading) const Text('Connecting to ESP...'),
              if (_connectionError) const Text('Make sure ESP is on!'),
              const SizedBox(height: 20.0),
              Center(child: Pdetailesbtn(onPressed: moveSetup)),
            ],
          ),
        ),
      ),
    );
  }
}
