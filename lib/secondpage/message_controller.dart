import 'dart:async';
import '../data.dart';
import 'package:intl/intl.dart';

var oldmessage = "";
var message = "";

class MessageController {
  Stream<String> subscribe() {
    return Stream.periodic(const Duration(seconds: 1), (count) {
      if (oldmessage != patentmessage) {
        oldmessage = patentmessage;
        String formattedTime = DateFormat('hh:mm:ss').format(DateTime.now());
        message = '$patentmessage - $formattedTime';
      }
      return message;
    });
  }
}
