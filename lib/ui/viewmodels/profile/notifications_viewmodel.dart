import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/image_paths.dart';
import '../../../../domain/entities/notification_item.dart';

class NotificationsViewModel extends ChangeNotifier {
  final List<NotificationItem> recent = const [
    NotificationItem(
      name: 'James William',
      subtitle: '5 minutes ago',
      time: '12:00',
      image: ImagePaths.peopleIcon,
    ),
    NotificationItem(
      name: 'Olivia Jake',
      subtitle: '5 minutes ago',
      time: '10:00',
      image: ImagePaths.peopleIcon,
    ),
    NotificationItem(
      name: 'Emily Joe',
      subtitle: '5 minutes ago',
      time: '08:00',
      image: ImagePaths.peopleIcon,
    ),
  ];

  final List<NotificationItem> last30 = const [
    NotificationItem(
      name: 'Olivia Jake',
      subtitle: '5 minutes ago',
      time: '12:00',
      image: ImagePaths.peopleIcon,
    ),
    NotificationItem(
      name: 'James William',
      subtitle: '5 minutes ago',
      time: '12:00',
      image: ImagePaths.peopleIcon,
    ),
    NotificationItem(
      name: 'Emily Joe',
      subtitle: '5 minutes ago',
      time: '12:00',
      image: ImagePaths.peopleIcon,
    ),
  ];
}
