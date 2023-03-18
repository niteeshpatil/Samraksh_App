import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  final TextEditingController controller;

  Name({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Patient Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter patient Name',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
