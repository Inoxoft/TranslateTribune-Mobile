import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';
import 'package:permission_handler/permission_handler.dart';

@lazySingleton
class NotificationsService extends ChangeNotifier {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool isGranted = false;

  Future<void> checkAndSchedule() async {
    await checkNotificationPermission();

    await clearScheduledNotifications();

    if (isGranted) {
      print("Notification permission is granted.");
      scheduleMorningNotification();
    } else {
      print("Notification permission is not granted.");
    }
  }

  Future<void> checkNotificationPermission() async {
    await Permission.notification.request();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    isGranted = await Permission.notification.isGranted;
    notifyListeners();
  }

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('launcher_icon');

    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (
        int id,
        String? title,
        String? body,
        String? payload,
      ) async {},
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (
        NotificationResponse notificationResponse,
      ) async {},
    );

    await checkAndSchedule();
  }

  void openNotificationsAppSettings() => AppSettings.openAppSettings(
        type: AppSettingsType.notification,
      );

  Future<void> scheduleMorningNotification() async {
    scheduleNotification(
      title: 'Good morning',
      body: 'Your daily news digest is ready for reading',
      scheduledNotificationDateTime: DateTime.now().copyWith(
        hour: 9,
        minute: 0,
        second: 0,
      ),
    );
  }

  NotificationDetails get notificationDetails {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }

  Future scheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
    required DateTime scheduledNotificationDateTime,
  }) async {
    return await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      TZDateTime.from(
        scheduledNotificationDateTime,
        local,
      ),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> clearScheduledNotifications() async {
    await notificationsPlugin.cancelAll();
  }
}
