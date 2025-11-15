import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  // dummy state for switches (no real functionality yet)
  bool darkMode = false;
  bool tts = true;

  void toggleDark(bool v) {
    darkMode = v;
    notifyListeners();
  }

  void toggleTts(bool v) {
    tts = v;
    notifyListeners();
  }
}
