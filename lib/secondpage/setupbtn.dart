import 'package:flutter/material.dart';

class SetupBtn extends StatelessWidget {
  final VoidCallback onPressed;

  const SetupBtn({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: onPressed,
        ),
        Text(
          'Move to setup page',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
