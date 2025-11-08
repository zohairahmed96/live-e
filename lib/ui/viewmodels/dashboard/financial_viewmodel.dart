import 'package:flutter/material.dart';

class FinancialViewModel extends ChangeNotifier {
  // 0..1 where 1 = 100%
  double budgetProgress = 0.62;

  void setProgress(double v) {
    budgetProgress = v.clamp(0, 1);
    notifyListeners();
  }

  void onBillRemindersTap(BuildContext ctx) {
    ScaffoldMessenger.of(
      ctx,
    ).showSnackBar(const SnackBar(content: Text('Bill Reminders tapped')));
  }

  void onSpendingTap(BuildContext ctx) {
    ScaffoldMessenger.of(
      ctx,
    ).showSnackBar(const SnackBar(content: Text('Spending tapped')));
  }
}
