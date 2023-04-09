import 'package:flutter/material.dart';

class DeviceDropdown extends StatelessWidget {
  final int? value;
  final ValueChanged<int?>? onChanged;

  DeviceDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Select Device',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 280,
            height: 47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(color: Colors.black, width: 0.5),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 0,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<int>(
              value: value,
              onChanged: onChanged,
              isExpanded: true,
              underline: const SizedBox(),
              dropdownColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                const DropdownMenuItem<int>(
                  value: 1,
                  child: Center(
                    child: Text(
                      'Device 1',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const DropdownMenuItem<int>(
                  value: 2,
                  child: Center(
                      child: Text(
                    'Device 2',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
