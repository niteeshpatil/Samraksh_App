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
  Timer? _timer;

  @override
  void initState() {
    initNotifications();
    super.initState();
  }

  void _connect() async {
    connect(setState);
    isconnected = true;
    runsubscribe(-1);
    // Show a notification when connected
    await showNotification(
        'Connected', 'You are now connected,To Stop Updates press Disconnect');

    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      if (p_state1 == 2 && isconnected) {
        await showNotification('Patient status',
            'The patient, named $p_name1, is currently in room $p_room1, We recommend checking on the patient to ensure their well-being.');
      }
      if (p_state2 == 2 && isconnected) {
        await showNotification('Patient status',
            'The patient, named $p_name2, is currently in room $p_room2, We recommend checking on the patient to ensure their well-being.');
      }
    });
  }

  void _disconnect() async {
    disconnect(setState);
    // Cancel the timer
    _timer?.cancel();
    isconnected = false;
    rundisconnect();

    // Show a notification when disconnected
    await showNotification('Disconnected',
        'You have been disconnected,To Get Updates press Connect');
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onConnectPressed: _connect,
      onDisconnectPressed: _disconnect,
    );
  }

  @override
  void dispose() {
    _disconnect();
    super.dispose();
  }
}
