import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final bool connected;
  final VoidCallback onConnectPressed;
  final VoidCallback onDisconnectPressed;

  const ButtonWidget({
    Key? key,
    required this.connected,
    required this.onConnectPressed,
    required this.onDisconnectPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 15),
          fixedSize: const Size(120, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: connected ? onDisconnectPressed : onConnectPressed,
        child: Text(connected ? 'Disconnect' : 'Connect'),
      ),
    );
  }
}
