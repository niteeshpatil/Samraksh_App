import 'package:mqtt_client/mqtt_server_client.dart';
import '../mqtt_test/subscribeToTopic.dart';
import '../mqtt_test/setupClient.dart';
import '../mqtt_test/connectToBroker.dart';
import '../data.dart';

void runsubscribe() async {
  final client = MqttServerClient('91.121.93.94', '1883');
  const subTopic = Receive_topic;

  setupClient(client);
  await connectToBroker(client);

  subscribeToTopic(client, subTopic);
}
