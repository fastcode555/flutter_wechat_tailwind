/*
import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../models/notification_model.dart';

class NotificationService extends GetxService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final _notifications = <NotificationModel>[].obs;
  final _unreadCount = 0.obs;

  List<NotificationModel> get notifications => _notifications;

  int get unreadCount => _unreadCount.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initNotifications();
    await _loadNotifications();
  }

  Future<void> _initNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );
  }

  void _onNotificationTap(NotificationResponse response) {
    // 处理通知点击事件
    final payload = response.payload;
    if (payload != null) {
      final notification = NotificationModel.fromJson(jsonDecode(payload));
      _handleNotificationTap(notification);
    }
  }

  void _handleNotificationTap(NotificationModel notification) {
    switch (notification.type) {
      case NotificationType.message:
        if (notification.senderId != null) {
          Get.toNamed('/chat/detail/${notification.senderId}');
        }
        break;
      case NotificationType.friendRequest:
        Get.toNamed('/contacts/new-friends');
        break;
      case NotificationType.comment:
      case NotificationType.like:
        if (notification.targetId != null) {
          Get.toNamed('/moments/detail/${notification.targetId}');
        }
        break;
      case NotificationType.system:
        // 处理系统通知
        break;
    }
  }

  Future<void> _loadNotifications() async {
    // TODO: 从服务器加载通知
    _notifications.value = [
      NotificationModel(
        id: '1',
        title: '新好友请求',
        body: '张三请求添加你为好友',
        type: NotificationType.friendRequest,
        senderId: 'user_1',
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      NotificationModel(
        id: '2',
        title: '朋友圈评论',
        body: '李四评论了你的朋友圈',
        type: NotificationType.comment,
        senderId: 'user_2',
        targetId: 'moment_1',
        createdAt: DateTime.now(),
      ),
    ];
    _updateUnreadCount();
  }

  void _updateUnreadCount() {
    _unreadCount.value = _notifications.where((n) => !n.isRead).length;
  }

  Future<void> showNotification(NotificationModel notification) async {
    // 检查通知权限
    final settings = await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    if (settings == false) return;

    // 构建通知详情
    const androidDetails = AndroidNotificationDetails(
      'wechat_channel',
      'WeChat Notifications',
      channelDescription: 'Notifications from WeChat',
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
    );

    // 显示通知
    await _flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      details,
      payload: jsonEncode(notification.toJson()),
    );

    // 添加到通知列表
    _notifications.insert(0, notification);
    _updateUnreadCount();
  }

  Future<void> markAsRead(String notificationId) async {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      final notification = _notifications[index];
      _notifications[index] = NotificationModel(
        id: notification.id,
        title: notification.title,
        body: notification.body,
        type: notification.type,
        targetId: notification.targetId,
        senderId: notification.senderId,
        createdAt: notification.createdAt,
        isRead: true,
        extra: notification.extra,
      );
      _updateUnreadCount();
    }
  }

  Future<void> markAllAsRead() async {
    final updatedNotifications = _notifications
        .map((notification) => NotificationModel(
              id: notification.id,
              title: notification.title,
              body: notification.body,
              type: notification.type,
              targetId: notification.targetId,
              senderId: notification.senderId,
              createdAt: notification.createdAt,
              isRead: true,
              extra: notification.extra,
            ))
        .toList();

    _notifications.value = updatedNotifications;
    _updateUnreadCount();
  }

  Future<void> clearAll() async {
    _notifications.clear();
    _updateUnreadCount();
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
*/
