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
      child: connected
          ? ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: onDisconnectPressed,
              child: const Text('Disconnect'),
            )
          : ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: onConnectPressed,
              child: const Text('Connect'),
            ),
    );
  }
}
