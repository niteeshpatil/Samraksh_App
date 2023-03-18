import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

final client = MqttServerClient('91.121.93.94', '1883');

void onSubscribed(String topic) {
  print('Subscription confirmed for topic $topic');
}

void onDisconnected() {
  print('OnDisconnected client callback - Client disconnection');
  if (client.connectionStatus!.disconnectionOrigin ==
      MqttDisconnectionOrigin.solicited) {
    print('OnDisconnected callback is solicited, this is correct');
  }
  exit(-1);
}

void onConnected() {
  print('OnConnected client callback - Client connection was sucessful');
}

void pong() {
  print('Ping response client callback invoked');
}
