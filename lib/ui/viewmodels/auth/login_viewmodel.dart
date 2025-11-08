import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool loading = false;

  String? emailValidator(String? v) {
    if (v == null || v.trim().isEmpty) return 'Enter email or phone';
    return null;
  }

  String? passValidator(String? v) {
    if (v == null || v.length < 6) return 'Minimum 6 characters';
    return null;
  }

  Future<void> login(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    loading = true;
    notifyListeners();
    await Future.delayed(
      const Duration(milliseconds: 900),
    ); // TODO: call usecase/API here
    loading = false;
    notifyListeners();

    // Navigate after success
    // Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  void disposeControllers() {
    emailCtrl.dispose();
    passCtrl.dispose();
  }
}
