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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Set limit',
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: DropdownButton<double>(
            value: value,
            onChanged: onChanged,
            underline: const SizedBox.shrink(),
            isExpanded: true,
            items: [
              const DropdownMenuItem<double>(
                value: null,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Set limit'),
                ),
              ),
              for (double i in _items)
                DropdownMenuItem<double>(
                  value: i,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('$i'),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
