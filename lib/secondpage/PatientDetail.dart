import 'dart:async';

import 'package:flutter/material.dart';
import '../data.dart';

class PatientDetail extends StatefulWidget {
  const PatientDetail({Key? key}) : super(key: key);

  @override
  _PatientDetailState createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  String name = p_name;
  String room = p_room;
  String astime = last_update;
  String status = 'Unknown'; // Initialize status to unknown
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // Start the timer to periodically check if last_update or p_state has changed
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (last_update != astime || p_state != getStatus()) {
        setState(() {
          astime = last_update;
          status = getStatus();
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  String getStatus() {
    switch (p_state) {
      case 0:
        return 'Unknown';
      case 1:
        return 'Stable';
      case 2:
        return 'Unstable';
      default:
        return 'Invalid State';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PatientDetailTable(
      key: UniqueKey(), // Assign a unique key
      name: name,
      room: room,
      status: status,
      astime: astime,
    );
  }
}

class PatientDetailTable extends StatelessWidget {
  final String name;
  final String room;
  final String status;
  final String astime;

  const PatientDetailTable({
    Key? key,
    required this.name,
    required this.room,
    required this.status,
    required this.astime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DataTableTheme(
        data: DataTableThemeData(
          dataRowColor: MaterialStateProperty.all<Color>(Colors.black),
          // ignore: prefer_const_constructors
          dataTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 167, 230, 251),
            border: Border.all(
              color: Color.fromARGB(255, 1, 0, 0),
              width: 2.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DataTable(
            // ignore: prefer_const_literals_to_create_immutables
            columns: [
              const DataColumn(
                label: Text(
                  'Patient Detail',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              DataColumn(
                label: const Text(
                  'Value',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(
                  Text(
                    'Patient Name',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
              DataRow(cells: [
                const DataCell(
                  Text(
                    'Patient Room',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    room,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
              DataRow(cells: [
                const DataCell(
                  Text(
                    'Patient Status',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    status,
                    style: TextStyle(
                      color: (() {
                        switch (p_state) {
                          case 0:
                            return Colors.yellow;
                          case 1:
                            return Colors.green;
                          case 2:
                            return Colors.red;
                          default:
                            return Colors.white;
                        }
                      })(),
                    ),
                  ),
                )
              ]),
              DataRow(cells: [
                const DataCell(
                  Text(
                    'Last Update',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    astime,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
