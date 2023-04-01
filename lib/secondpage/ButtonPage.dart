import 'dart:async';
import 'package:flutter/material.dart';
import 'ButtonWidget.dart';
import 'button_functions.dart';
import '../setupfunctions/subscribe.dart';
import '../setupfunctions/disconnect.dart';
import '../data.dart';
import '../notification/notifi_service.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _connected = false;

  Timer? _timer;

  @override
  void initState() {
    initNotifications();
    super.initState();
  }

  void _connect() async {
    connect(setState);
    _connected = true;
    runsubscribe(-1);
    // Show a notification when connected
    await showNotification('Connected', 'You are now connected to the ESP32.');

    Timer.periodic(Duration(seconds: 5), (timer) async {
      if (p_state == 2) {
        await showNotification('Status', 'patent condition is unstable.');
      }
    });
  }

  void _disconnect() async {
    disconnect(setState);
    _connected = false;
    rundisconnect();

    // Cancel the timer
    _timer?.cancel();

    // Show a notification when disconnected
    await showNotification(
        'Disconnected', 'You have been disconnected from  ESP32.');
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      connected: _connected,
      onConnectPressed: _connect,
      onDisconnectPressed: _disconnect,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
