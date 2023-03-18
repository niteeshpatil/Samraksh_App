import 'dart:developer';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTService {
  late MqttServerClient _client;

  void initializeMQTTClient() {
    _client = MqttServerClient('91.121.93.94', '1883');
    _client.keepAlivePeriod = 60;
    _client.onDisconnected = onDisConnected;
    _client.onConnected = onConnected;
    _client.onSubscribed = onSubscribed;
    _client.pongCallback = pong;

    final connMess = MqttConnectMessage()
        .withClientIdentifier('taylanyildz')
        .withWillTopic('willTopic')
        .withWillMessage('willMessage')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    print('Connecting....');
    _client.connectionMessage = connMess;
  }

  Future connectMQTT() async {
    try {
      await _client.connect();
    } on NoConnectionException catch (e) {
      log(e.toString());
      _client.disconnect();
    }
  }

  void disConnectMQTT() {
    try {
      _client.disconnect();
    } catch (e) {
      log(e.toString());
    }
  }

  void onConnected() {
    log('Connected');
    puslish("conected!..");
  }

  void onDisConnected() {
    log('Disconnected');
  }

  void pong() {
    log("Ping response");
  }

  void puslish(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    _client.publishMessage('hello', MqttQos.atLeastOnce, builder.payload!);
    builder.clear();
  }

  void onSubscribed(String topic) {
    log("Subscribing");
    try {
      _client.subscribe("hello1", MqttQos.atLeastOnce);
      _client.updates!.listen((dynamic t) {
        final MqttPublishMessage recMess = t[0].payload;
        final message =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

        print('message id : ${recMess.variableHeader?.messageIdentifier}');
        print('message : $message');
      });
    } catch (e) {
      log(e.toString());
    }
  }
}

void main() async {
  final mqttService = MQTTService();
  mqttService.initializeMQTTClient();
  await mqttService.connectMQTT();
}
