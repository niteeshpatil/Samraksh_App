import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// https://www.youtube.com/watch?v=26TTYlwc6FM
class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin;

  NotificationService(this.notificationsPlugin);

  Future<void> initNotification() async {
    try {
      AndroidInitializationSettings initializationSettingsAndroid =
          const AndroidInitializationSettings('flutter_logo');

      var initializationSettingsIOS = DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          onDidReceiveLocalNotification:
              (int id, String? title, String? body, String? payload) async {});

      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
      await notificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse:
              (NotificationResponse notificationResponse) async {});
    } catch (e) {
      print('Failed to initialize notifications plugin: $e');
    }
  }

  static NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    return notificationsPlugin.show(
        id, title, body, await NotificationService.notificationDetails(),
        payload: payload);
  }
}
