import 'package:flutter/material.dart';

class BillRemindersViewModel extends ChangeNotifier {
  DateTime current = DateTime.now();
  final Set<DateTime> reminders = {
    // sample highlighted dates (normalize to yyyy-mm-dd)
    DateTime(DateTime.now().year, DateTime.now().month, 6),
    DateTime(DateTime.now().year, DateTime.now().month, 15),
    DateTime(DateTime.now().year, DateTime.now().month, 26),
  };

  void prevMonth() {
    current = DateTime(current.year, current.month - 1, 1);
    notifyListeners();
  }

  void nextMonth() {
    current = DateTime(current.year, current.month + 1, 1);
    notifyListeners();
  }

  bool isReminder(DateTime d) => reminders.any(
    (r) => r.year == d.year && r.month == d.month && r.day == d.day,
  );

  // add/remove hooks
  void toggleReminder(DateTime d) {
    final found = reminders.lookup(DateTime(d.year, d.month, d.day));
    if (found != null) {
      reminders.removeWhere(
        (r) => r.year == d.year && r.month == d.month && r.day == d.day,
      );
    } else {
      reminders.add(DateTime(d.year, d.month, d.day));
    }
    notifyListeners();
  }
}
