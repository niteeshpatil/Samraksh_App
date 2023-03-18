import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import '../mqtt_test/publishToTopic.dart';
import '../mqtt_test/subscribeToTopic.dart';
import '../mqtt_test/setupClient.dart';
import '../mqtt_test/connectToBroker.dart';

void runMqttTest(String message) async {
  final client = MqttServerClient('91.121.93.94', '1883');
  const subTopic = 'hello1';
  const pubTopic = 'hello';

  setupClient(client);
  await connectToBroker(client);

  subscribeToTopic(client, subTopic);

  publishToTopic(client, pubTopic, message);

  print('Sleeping....');
  await MqttUtilities.asyncSleep(20);

  print('Unsubscribing');

  client.unsubscribe(subTopic);
  client.unsubscribe(pubTopic);

  client.disconnect();
}
