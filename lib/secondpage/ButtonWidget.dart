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
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                blurRadius: 0,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // ignore: deprecated_member_use
              primary: Colors.black,
              textStyle: const TextStyle(fontSize: 15),
              fixedSize: const Size(120, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: isconnected ? onDisconnectPressed : onConnectPressed,
            child: Text(isconnected ? 'Disconnect' : 'Connect'),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          isconnected ? '' : '',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
