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
import 'package:intl/intl.dart';

Future<void> subscribeToTopic(MqttServerClient client, String topic) async {
  print('Subscribing to the $topic topic');
  await client.subscribe(topic, MqttQos.atMostOnce);

  await client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    final recMess = c![0].payload as MqttPublishMessage;
    final pt =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print('Received message: topic is ${c[0].topic}, payload is $pt');
    String data = pt;
    try {
      isset = int.parse(data[0]);
      p_state = int.parse(data[1]);
    } catch (e) {
      print("Error occurred while parsing the data: $e");
    }
    last_update = DateFormat(' hh:mm:ss a dd/MM/yy').format(DateTime.now());
  });
}
