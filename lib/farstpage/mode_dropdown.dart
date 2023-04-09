import 'package:flutter/material.dart';

class ModeDropdown extends StatelessWidget {
  final double? value;
  final ValueChanged<double?>? onChanged;

  ModeDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Select Mode',
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
            child: DropdownButton<double>(
              value: value,
              onChanged: onChanged,
              isExpanded: true,
              underline: const SizedBox(),
              dropdownColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                const DropdownMenuItem<double>(
                  value: null,
                  child: Center(
                      child: Text(
                    'Select Mode',
                    style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                const DropdownMenuItem<double>(
                  value: 5.0,
                  child: Center(
                      child: Text(
                    'Accident Patient',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                const DropdownMenuItem<double>(
                  value: 20.0,
                  child: Center(
                      child: Text(
                    'Pregnant Women',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                const DropdownMenuItem<double>(
                  value: 0.25,
                  child: Center(
                      child: Text(
                    'Coma Patient',
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
