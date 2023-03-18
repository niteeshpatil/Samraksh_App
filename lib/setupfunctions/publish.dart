import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import '../mqtt_test/publishToTopic.dart';
import '../mqtt_test/setupClient.dart';
import '../mqtt_test/connectToBroker.dart';
import '../data.dart';

void runpublish(String message) async {
  final client = MqttServerClient('91.121.93.94', '1883');
  const pubTopic = Send_topic;

  setupClient(client);
  await connectToBroker(client);

  publishToTopic(client, pubTopic, message);

  print('Sleeping....');
  await MqttUtilities.asyncSleep(1);

  print('Unsubscribing');

  client.unsubscribe(pubTopic);

  client.disconnect();
}
