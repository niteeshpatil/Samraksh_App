import 'package:flutter/material.dart';
import '../secondpage/message_screen.dart';
import '../secondpage/ButtonPage.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Notification'),
        ),
        body: Column(
          children: [
            Expanded(child: MessageScreen()),
            Expanded(child: Button()),
          ],
        ),
      ),
    );
  }
}
