// ignore: file_names
import '../data.dart';
import 'package:mqtt_client/mqtt_client.dart'
    show
        MqttMessage,
        MqttPublishMessage,
        MqttPublishPayload,
        MqttQos,
        MqttReceivedMessage;
import 'package:mqtt_client/mqtt_server_client.dart';

void subscribeToTopic(MqttServerClient client, String topic) {
  print('Subscribing to the $topic topic');
  client.subscribe(topic, MqttQos.atMostOnce);

  client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    final recMess = c![0].payload as MqttPublishMessage;
    final pt =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print('Received message: topic is ${c[0].topic}, payload is $pt');
    patentmessage =pt;
  });
}
