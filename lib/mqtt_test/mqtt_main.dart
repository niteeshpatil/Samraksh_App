import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'publishToTopic.dart';
import 'subscribeToTopic.dart';
import 'setupClient.dart';
import 'connectToBroker.dart';

final client = MqttServerClient('91.121.93.94', '1883');
const subTopic = 'hello1';
const pubTopic = 'hello';
const message = 'Hello from mndg';

Future<int> main() async {
  setupClient(client);
  await connectToBroker(client);

  subscribeToTopic(client, subTopic);

  publishToTopic(client, pubTopic, message);

  print('Sleeping....');
  await MqttUtilities.asyncSleep(80);

  print('Unsubscribing');

  client.unsubscribe(subTopic);
  client.unsubscribe(pubTopic);

  return 0;
}
