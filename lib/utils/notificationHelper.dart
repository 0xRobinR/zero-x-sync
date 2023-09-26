import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:wallet/assets/Colors.dart';
import 'package:wallet/config/index.dart';

AndroidNotificationDetails _androidNotificationDetails =
AndroidNotificationDetails(
    appShort,
    appChannel,
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
    color: colorApp
);


const IOSNotificationDetails _iosNotificationDetails = IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
);

NotificationDetails platformChannelSpecifics =
NotificationDetails(
    android: _androidNotificationDetails,
    iOS: _iosNotificationDetails);

