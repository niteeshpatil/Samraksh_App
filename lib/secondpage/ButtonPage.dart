import 'package:flutter/material.dart';
import 'ButtonWidget.dart';
import 'button_functions.dart';
import '../setupfunctions/subscribe.dart';
import '../setupfunctions/disconnect.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _connected = false;

  void _connect() async {
    connect(setState);
    _connected = true;
    runsubscribe();
  }

  void _disconnect() async {
    disconnect(setState);
    _connected = false;
    runisconnect();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      connected: _connected,
      onConnectPressed: _connect,
      onDisconnectPressed: _disconnect,
    );
  }
}
