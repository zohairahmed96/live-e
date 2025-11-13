import 'package:flutter/material.dart';

class ReminderItem {
  final String image;
  final String title;
  final String time;
  bool enabled;
  ReminderItem({required this.image, required this.title, required this.time, this.enabled = true});
}

class ChoreItem {
  final Widget icon;
  final String title;
  bool done;
  ChoreItem({required this.icon, required this.title, this.done = false});
}

class DailyRoutineViewModel extends ChangeNotifier {
  // demo images – put your assets in assets/images/
  final reminders = <ReminderItem>[
    ReminderItem(image: 'assets/images/pills.jpg',  title: 'Take Medication', time: '8:00 AM', enabled: true),
    ReminderItem(image: 'assets/images/heartbeat.jpg', title: 'Eat Lunch',     time: '12:00 PM', enabled: true),
    ReminderItem(image: 'assets/images/walk.jpg',   title: 'Go for a Walk',   time: '4:00 PM', enabled: false),
  ];

  void toggleReminder(int i, bool v) { reminders[i].enabled = v; notifyListeners(); }

  // chores (replace icons with your SVG/PNG if you have)
  late final chores = <ChoreItem>[
    ChoreItem(icon: const Icon(Icons.brush, color: Color(0xFF3CA4DC)), title: 'Brush Teeth',  done: true),
    ChoreItem(icon: const Icon(Icons.local_laundry_service, color: Color(0xFF3CA4DC)), title: 'Fold Laundry', done: true),
    ChoreItem(icon: const Icon(Icons.restaurant, color: Color(0xFF3CA4DC)), title: 'Eat Dinner', done: true),
  ];
  void toggleChore(int i, bool v) { chores[i].done = v; notifyListeners(); }

  // slider (morning/afternoon)
  double routinePos = .5; // 0 = Morning, 1 = Afternoon
  void setRoutine(double v) { routinePos = v; notifyListeners(); }
}
