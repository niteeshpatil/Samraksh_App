// ignore: file_names
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';

Future<void> connectToBroker(MqttClient client) async {
  try {
    await client.connect();
  } on NoConnectionException catch (e) {
    print('Client exception: $e');
    client.disconnect();
  } on SocketException catch (e) {
    print('Socket exception: $e');
    client.disconnect();
  }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('Client connected');
  } else {
    print(
        'Client connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
    exit(-1);
  }
}
