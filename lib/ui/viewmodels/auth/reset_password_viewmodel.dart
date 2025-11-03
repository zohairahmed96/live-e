import 'package:flutter/material.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  bool loading = false;

  String? emailValidator(String? v) {
    if (v == null || v.trim().isEmpty) return 'Enter email';
    final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim());
    return ok ? null : 'Enter a valid email';
  }

  Future<void> sendLink(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    loading = true;
    notifyListeners();

    // TODO: call your usecase/repo to send reset email
    await Future.delayed(const Duration(milliseconds: 900));

    loading = false;
    notifyListeners();

    // Optional: show confirmation
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Password reset link sent')));
    Navigator.pop(context); // go back to login
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }
}
