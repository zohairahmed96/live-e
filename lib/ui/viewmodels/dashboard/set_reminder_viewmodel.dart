import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SetReminderViewModel extends ChangeNotifier {
  final titleCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final timeCtrl = TextEditingController();
  final repeatCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool saving = false;

  DateTime? pickedDate;
  TimeOfDay? pickedTime;

  Future<void> pickDate(BuildContext ctx) async {
    final now = DateTime.now();
    final d = await showDatePicker(
      context: ctx,
      initialDate: pickedDate ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 5),
      builder: (context, child) =>
          Theme(data: Theme.of(context), child: child!),
    );
    if (d != null) {
      pickedDate = d;
      dateCtrl.text = DateFormat('MM/dd/yyyy').format(d); // 11/06/2025 style
      notifyListeners();
    }
  }

  Future<void> pickTime(BuildContext ctx) async {
    final t = await showTimePicker(
      context: ctx,
      initialTime: pickedTime ?? const TimeOfDay(hour: 12, minute: 0),
      builder: (context, child) =>
          Theme(data: Theme.of(context), child: child!),
    );
    if (t != null) {
      pickedTime = t;
      final dt = DateTime(0, 1, 1, t.hour, t.minute);
      timeCtrl.text = DateFormat('h.mm a').format(dt); // 12.00 PM
      notifyListeners();
    }
  }

  String? notEmpty(String? v, String f) =>
      (v == null || v.trim().isEmpty) ? 'Enter $f' : null;

  Future<void> submit(BuildContext ctx) async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    saving = true;
    notifyListeners();
    await Future.delayed(
      const Duration(milliseconds: 700),
    ); // TODO: call usecase
    saving = false;
    notifyListeners();
    ScaffoldMessenger.of(
      ctx,
    ).showSnackBar(const SnackBar(content: Text('Reminder saved')));
    Navigator.pop(ctx);
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    dateCtrl.dispose();
    timeCtrl.dispose();
    repeatCtrl.dispose();
    super.dispose();
  }
}
