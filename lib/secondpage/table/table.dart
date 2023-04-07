import 'dart:async';

import 'package:flutter/material.dart';
import '../../data.dart';
import '../../globledata.dart';

class PatientDetail extends StatefulWidget {
  final int _device;
  final int _expandedIndex;

  const PatientDetail(this._device, this._expandedIndex, {Key? key})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PatientDetailState createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  String name = "";
  String room = "";
  String astime = "No previous updates....";
  String status = 'Unknown'; // Initialize status to unknown
  String theading = "";
  Timer? timer;
  late int device;

  @override
  void initState() {
    super.initState();
    device = widget._device + 1;
    theading = "   Device ${device}";

    if (device == 1) {
      name = p_name1;
      room = p_room1;
      astime = last_update1;
    } else {
      name = p_name2;
      room = p_room2;
      astime = last_update2;
    }
    // Start the timer to periodically check if last_update or p_state has changed
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      bool check1 = false;
      bool check2 = false;
      if (last_update1 != astime || p_state1 != getStatus(p_state1)) {
        check1 = true;
      }
      if (last_update2 != astime || p_state2 != getStatus(p_state2)) {
        check2 = true;
      }
      if ((check1 && device == 1) || (check2 && device == 2)) {
        setState(() {
          if (device == 1) {
            name = p_name1;
            room = p_room1;
            astime = last_update1;
            status = getStatus(p_state1);
          } else {
            name = p_name2;
            room = p_room2;
            astime = last_update2;
            status = getStatus(p_state2);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  String getStatus(state) {
    switch (state) {
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

  void reset() {
    // Add reset logic here
    resetgobledata(device);
    print('Reset button pressed! for $device');
  }

  @override
  Widget build(BuildContext context) {
    return widget._expandedIndex == widget._device
        ? Center(
            child: DataTableTheme(
              data: DataTableThemeData(
                dataRowColor: MaterialStateProperty.all<Color>(Colors.white),
                dataTextStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: const Color.fromARGB(255, 1, 0, 0),
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    DataTable(
                      columns: [
                        DataColumn(
                          label: Text(
                            theading,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const DataColumn(
                          label: Text(
                            '   Details',
                            style: TextStyle(
                              color: Colors.white,
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
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              name,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          const DataCell(
                            Text(
                              'Patient Room',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              room,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ]),
                        DataRow(cells: [
                          const DataCell(
                            Text(
                              'Patient Status',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              status,
                              style: TextStyle(
                                color: (() {
                                  switch (status) {
                                    case 'Unknown':
                                      return Colors.orange;
                                    case 'Stable':
                                      return Colors.green;
                                    case 'Unstable':
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
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              astime,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 12,
                        ),
                        fixedSize: const Size(70, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: reset,
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white, // set the color property here
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
