import 'dart:async';
import 'package:flutter/material.dart';
import 'message_controller.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final StreamController<String> _messageController =
      StreamController<String>();
  late StreamSubscription<String> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = MessageController().subscribe().listen((message) {
      _messageController.add(message);
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _messageController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'NOTIFICATION',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          width: 300.0,
          height: 150.0,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: StreamBuilder<String>(
              stream: _messageController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.center,
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
