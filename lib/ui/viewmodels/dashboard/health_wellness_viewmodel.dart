// lib/ui/viewmodels/health/health_wellness_viewmodel.dart
import 'package:flutter/material.dart';

class HealthWellnessViewModel extends ChangeNotifier {
  bool medMorning = true; // 8:00 AM
  bool medEvening = true; // 5:00 PM
  void toggleMorning(bool v) { medMorning = v; notifyListeners(); }
  void toggleEvening(bool v) { medEvening = v; notifyListeners(); }

  int mood = 1; // 0=happy,1=neutral,2=sad
  void setMood(int v) { mood = v; notifyListeners(); }
}
