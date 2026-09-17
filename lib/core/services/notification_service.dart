import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:switchboard/features/home/data/datasources/resilience_tip_service.dart';
import 'package:switchboard/features/home/data/models/resilience_tip.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService instance = NotificationService._internal();

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;

    try {
      // 1. Initialize TimeZones
      tz.initializeTimeZones();

      // 2. Platform initialization settings
      const androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const darwinSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );

      const initSettings = InitializationSettings(
        android: androidSettings,
        iOS: darwinSettings,
        macOS: darwinSettings,
      );

      await _notificationsPlugin.initialize(
        settings: initSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          debugPrint('Notification clicked: ${response.payload}');
        },
      );

      _isInitialized = true;

      // Request permissions & schedule notification in background
      requestPermissions().then((_) {
        scheduleWeeklyResilienceTipNotification();
      });
    } catch (e) {
      debugPrint('Error initializing NotificationService: $e');
    }
  }

  Future<void> requestPermissions() async {
    try {
      final androidImplementation =
          _notificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      if (androidImplementation != null) {
        await androidImplementation.requestNotificationsPermission();
      }

      final iosImplementation =
          _notificationsPlugin.resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>();
      if (iosImplementation != null) {
        await iosImplementation.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
      }
    } catch (e) {
      debugPrint('Error requesting notification permissions: $e');
    }
  }

  tz.TZDateTime _nextInstanceOfMondayTenAM() {
    tz.Location location;
    try {
      location = tz.local;
    } catch (_) {
      location = tz.getLocation('UTC');
    }

    final tz.TZDateTime now = tz.TZDateTime.now(location);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(location, now.year, now.month, now.day, 10, 0);

    while (scheduledDate.weekday != DateTime.monday) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 7));
    }

    return scheduledDate;
  }

  Future<void> scheduleWeeklyResilienceTipNotification() async {
    try {
      final scheduledDate = _nextInstanceOfMondayTenAM();
      final weekNum =
          ResilienceTipService.instance.getWeekOfYear(scheduledDate);
      final ResilienceTip? tip =
          await ResilienceTipService.instance.getTipForWeek(weekNum);

      final title = tip != null
          ? '💡 Resilience Tip of the Week: ${tip.title}'
          : '💡 Resilience Tip of the Week';
      final body = tip?.actionText ??
          'Take a moment today to reinforce your resilience and mental readiness.';

      const androidDetails = AndroidNotificationDetails(
        'weekly_resilience_tips',
        'Weekly Resilience Tips',
        channelDescription:
            'Notifications for weekly resilience tips delivered every Monday at 10:00 AM',
        importance: Importance.high,
        priority: Priority.high,
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
        macOS: iosDetails,
      );

      // Cancel previous scheduled weekly notification to avoid duplicates
      await _notificationsPlugin.cancel(id: 1001);

      await _notificationsPlugin.zonedSchedule(
        id: 1001,
        title: title,
        body: body,
        scheduledDate: scheduledDate,
        notificationDetails: details,
        androidScheduleMode: AndroidScheduleMode.inexact,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
        payload: 'resilience_tip_week_$weekNum',
      );

      debugPrint(
        'Successfully scheduled weekly resilience tip notification for Monday at 10:00 AM ($scheduledDate)',
      );
    } catch (e) {
      debugPrint('Error scheduling weekly resilience tip notification: $e');
    }
  }

  Future<void> showInstantTestNotification() async {
    try {
      final weekNum = ResilienceTipService.instance.getWeekOfYear();
      final ResilienceTip? tip =
          await ResilienceTipService.instance.getTipForWeek(weekNum);

      final title = tip != null
          ? '💡 Resilience Tip of the Week: ${tip.title}'
          : '💡 Resilience Tip of the Week';
      final body = tip?.actionText ??
          'Take a moment today to reinforce your resilience and mental readiness.';

      const androidDetails = AndroidNotificationDetails(
        'weekly_resilience_tips',
        'Weekly Resilience Tips',
        channelDescription:
            'Notifications for weekly resilience tips delivered every Monday at 10:00 AM',
        importance: Importance.high,
        priority: Priority.high,
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
        macOS: iosDetails,
      );

      await _notificationsPlugin.show(
        id: 9999,
        title: title,
        body: body,
        notificationDetails: details,
        payload: 'test_resilience_tip',
      );
    } catch (e) {
      debugPrint('Error showing instant test notification: $e');
    }
  }
}
