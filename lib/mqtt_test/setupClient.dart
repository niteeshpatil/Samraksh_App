// ignore: file_names
import 'package:mqtt_client/mqtt_client.dart'
    show MqttClient, MqttConnectMessage, MqttQos;
import 'mqtt_callbacks.dart';

Future<void> setupClient(MqttClient client) async {
  client.logging(on: false);
  // client.keepAlivePeriod = 5;
  // client.onDisconnected = onDisconnected;
  client.onConnected = onConnected;
  client.onSubscribed = onSubscribed;
  // client.pongCallback = pong;

  final connMess = MqttConnectMessage()
      .withClientIdentifier('dart_client')
      .withWillTopic('willtopic')
      .withWillMessage('My Will message')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);
  print('Client connecting....');
  client.connectionMessage = connMess;
}
