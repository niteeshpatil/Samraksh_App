// ignore: file_names
import '../data.dart';
import '../globledata.dart';
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
    //data will be recived in form of "deviceId deviceisset condition" that is like "100" "211" etc
    try {
      int curdevice = int.parse(data[0]);
      int curdset = int.parse(data[1]);
      int curstate = int.parse(data[2]);
      if (curdevice == 1) {
        device1isset = curdset;
        p_state1 = curstate;
        last_update1 =
            DateFormat(' hh:mm:ss a dd/MM/yy').format(DateTime.now());
      }
      if (curdevice == 2) {
        device2isset = curdset;
        p_state2 = curstate;
        last_update2 =
            DateFormat(' hh:mm:ss a dd/MM/yy').format(DateTime.now());
      }
      if (device1isset == 1 || device2isset == 1) {
        isset = 1;
      } else {
        isset = 0;
      }
      saveDataBeforeAppClose();
    } catch (e) {
      print("Error occurred while parsing the data: $e");
    }
  });
}
