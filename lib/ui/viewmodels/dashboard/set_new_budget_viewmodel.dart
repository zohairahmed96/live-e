// lib/ui/viewmodels/health/health_wellness_viewmodel.dart
import 'package:flutter/material.dart';

class SetNewBudgetViewmodel extends ChangeNotifier {
  final newBudget = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController groceryController = TextEditingController();
  TextEditingController utilityController = TextEditingController();
  TextEditingController savingsController = TextEditingController();

  String? selectedPeriod;

  List<String> periods = ["Weekly", "Monthly", "Yearly"];

  int totalBudget = 800;
  int remainingBudget = 500;
  double progressValue = 0.6;

  void onPeriodChange(String? value) {
    selectedPeriod = value;
    notifyListeners();
  }

  void saveBudget() {
    print("Budget Saved");
  }

  void calculate() {
    notifyListeners();
  }
}
