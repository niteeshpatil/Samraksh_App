import 'package:flutter/material.dart';
import 'package:samraksh/data.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onConnectPressed;
  final VoidCallback onDisconnectPressed;

  const ButtonWidget({
    Key? key,
    required this.onConnectPressed,
    required this.onDisconnectPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              textStyle: const TextStyle(fontSize: 15),
              fixedSize: const Size(120, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: isconnected ? onDisconnectPressed : onConnectPressed,
            child: Text(isconnected ? 'Disconnect' : 'Connect'),
          ),
        ),
        const SizedBox(height: 2),
        Text(isconnected
            ? 'Disconnect to stop updates'
            : 'Connect to get updates'),
      ],
    );
  }
}
