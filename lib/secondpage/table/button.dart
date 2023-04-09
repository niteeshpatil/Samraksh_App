import 'package:flutter/material.dart';

class ButtonExpand extends StatelessWidget {
  final String text;
  final int index;
  final int expandedIndex;
  final VoidCallback onTap;

  const ButtonExpand(this.text, this.index, this.expandedIndex, this.onTap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold, // set the color property here
                fontSize: 15,
              ),
            ),
          ),
          IconButton(
            onPressed: onTap,
            icon: Icon(
                expandedIndex == index ? Icons.expand_less : Icons.expand_more),
          ),
        ],
      ),
    );
  }
}
