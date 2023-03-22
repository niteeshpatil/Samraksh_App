import 'package:mqtt_client/mqtt_server_client.dart';
import '../mqtt_test/subscribeToTopic.dart';
import '../mqtt_test/setupClient.dart';
import '../mqtt_test/connectToBroker.dart';
import '../data.dart';
import 'package:mqtt_client/mqtt_client.dart';

Future<void> runsubscribe(int timeout) async {
  final client = MqttServerClient('91.121.93.94', '1883');
  const subTopic = Receive_topic;

  await setupClient(client);
  await connectToBroker(client);

  subscribeToTopic(client, subTopic);

  if (timeout != -1) {
    print('waiting for ack....');
    await MqttUtilities.asyncSleep(timeout);
    client.disconnect();
  }
  print('timeout for ack....');
}
