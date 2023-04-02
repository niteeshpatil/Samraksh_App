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
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<int>(
              value: value,
              onChanged: onChanged,
              isExpanded: true,
              underline: const SizedBox(),
              dropdownColor: Colors.grey[200],
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                const DropdownMenuItem<int>(
                  value: 1,
                  child: Center(child: Text('Device 1')),
                ),
                const DropdownMenuItem<int>(
                  value: 2,
                  child: Center(child: Text('Device 2')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
