import 'package:flutter/material.dart';

class LimitDropdown extends StatelessWidget {
  final double? value;
  final ValueChanged<double?>? onChanged;

  LimitDropdown({required this.value, required this.onChanged});

  final List<double> _items = [
    1,
    1.5,
    2,
    2.5,
    3,
    3.5,
    4,
    5,
    6,
    7,
    8,
    10,
    15,
    20,
    25,
    30,
    35
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Set limit',
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: DropdownButton<double>(
              value: value,
              onChanged: onChanged,
              underline: const SizedBox.shrink(),
              isExpanded: true,
              dropdownColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
              items: [
                const DropdownMenuItem<double>(
                  value: null,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Set limit',
                      style: TextStyle(
                          color: Color.fromARGB(150, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                for (double i in _items)
                  DropdownMenuItem<double>(
                    value: i,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '$i',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
