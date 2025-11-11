import 'package:flutter/material.dart';
import 'package:liv_e/ui/components/spending_pie_chart.dart';

class SpendingOverviewViewModel extends ChangeNotifier {
  // Colors from your mock
  static const darkBlue = Color(0xFF334EA0);
  static const lightBlue = Color(0xFF3CA4DC);
  static const midBlue = Color(0xFF76B8F0);

  final slices = const <SpendingSliceData>[
    SpendingSliceData('Entertainment', 60, darkBlue),
    SpendingSliceData('Food', 25, lightBlue),
    SpendingSliceData('Transport', 15, midBlue),
  ];

  final double totalSpent = 1200;
  final double budgetGoal = 1500;
  double get remaining => (budgetGoal - totalSpent).clamp(0, budgetGoal);
  double get progress => (totalSpent / budgetGoal).clamp(0, 1);
}
