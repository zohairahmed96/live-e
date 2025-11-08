import 'package:flutter/material.dart';
import '../../../domain/entities/notification_item.dart';

class NotificationsViewModel extends ChangeNotifier {
  final List<NotificationItem> recent = const [
    NotificationItem(name: 'James William', subtitle: '5 minutes ago', time: '12:00'),
    NotificationItem(name: 'Olivia Jake',   subtitle: '5 minutes ago', time: '10:00'),
    NotificationItem(name: 'Emily Joe',     subtitle: '5 minutes ago', time: '08:00'),
  ];

  final List<NotificationItem> last30 = const [
    NotificationItem(name: 'Olivia Jake',   subtitle: '5 minutes ago', time: '12:00'),
    NotificationItem(name: 'James William', subtitle: '5 minutes ago', time: '12:00'),
    NotificationItem(name: 'Emily Joe',     subtitle: '5 minutes ago', time: '12:00'),
  ];
}