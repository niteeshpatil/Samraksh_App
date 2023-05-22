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
import '../notification/notifi_service.dart';

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
      int curmobile_id = int.parse(data.substring(data.length - 4));
      if (curdevice == 1 && curmobile_id == mobile_id) {
        device1isset = curdset;
        p_state1 = curstate;
        last_update1 =
            DateFormat(' hh:mm:ss a dd/MM/yy').format(DateTime.now());
        if (curstate == 2 && connected) {
          showNotification('Patient status (Device-1)',
              'The patient, named $p_name1, is currently in room $p_room1, We recommend checking on the patient to ensure their well-being.');
        }
      }
      if (curdevice == 2 && curmobile_id == mobile_id) {
        device2isset = curdset;
        p_state2 = curstate;
        last_update2 =
            DateFormat(' hh:mm:ss a dd/MM/yy').format(DateTime.now());
        if (curstate == 2 && connected) {
          showNotification('Patient status (Device-2)',
              'The patient, named $p_name2, is currently in room $p_room2, We recommend checking on the patient to ensure their well-being.');
        }
      }
      if ((device1isset == 1 || device2isset == 1) &&
          curmobile_id == mobile_id) {
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
