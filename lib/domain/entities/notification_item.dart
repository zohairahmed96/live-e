class NotificationItem {
  final String name;
  final String subtitle; // e.g., "5 minutes ago"
  final String time;     // e.g., "12:00"

  const NotificationItem({
    required this.name,
    required this.subtitle,
    required this.time,
  });
}