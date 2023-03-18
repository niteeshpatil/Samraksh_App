// ignore_for_file: file_names

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void publishToTopic(MqttServerClient client, String topic, String message) {
  final builder = MqttClientPayloadBuilder();
  builder.addString(message);

  print('Publishing to $topic');
  client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);

  client.published!.listen((MqttPublishMessage message) {
    print(
        'Published topic: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
  });
}
