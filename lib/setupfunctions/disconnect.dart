import 'package:mqtt_client/mqtt_server_client.dart';
import '../mqtt_test/setupClient.dart';
import '../mqtt_test/connectToBroker.dart';
import '../data.dart';

void runisconnect() async {
  final client = MqttServerClient('91.121.93.94', '1883');
  const subTopic = Receive_topic;

  setupClient(client);
  await connectToBroker(client);

  print('Unsubscribing');

  client.unsubscribe(subTopic);
  client.disconnect();
}
