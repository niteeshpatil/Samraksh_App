import 'package:flutter/material.dart';

class Pdetailesbtn extends StatelessWidget {
  final VoidCallback onPressed;
  const Pdetailesbtn({required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onPressed,
        ),
        Text(
          'Move to details page',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
