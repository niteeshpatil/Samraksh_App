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
          icon: const Icon(Icons.home_filled),
          onPressed: onPressed,
        ),
        const Text(
          '',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
