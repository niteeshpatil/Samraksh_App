import 'package:flutter/material.dart';

class ModeDropdown extends StatelessWidget {
  final double? value;
  final ValueChanged<double?>? onChanged;

  ModeDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Select Mode',
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
          child: DropdownButton<double>(
            value: value,
            onChanged: onChanged,
            isExpanded: true,
            underline: const SizedBox(),
            dropdownColor: Colors.grey[200],
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const DropdownMenuItem<double>(
                value: null,
                child: Center(child: Text('Select Mode')),
              ),
              const DropdownMenuItem<double>(
                value: 5.0,
                child: Center(child: Text('Accident Patient')),
              ),
              const DropdownMenuItem<double>(
                value: 20.0,
                child: Center(child: Text('Pregnant Women')),
              ),
              const DropdownMenuItem<double>(
                value: 0.25,
                child: Center(child: Text('Coma Patient')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
