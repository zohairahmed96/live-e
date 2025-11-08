import 'package:flutter/material.dart';

class SignupViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final cpassCtrl = TextEditingController();

  bool loading = false;
  bool obscure1 = true;
  bool obscure2 = true;

  String? notEmpty(String? v, String field) =>
      (v == null || v.trim().isEmpty) ? 'Enter $field' : null;

  String? emailValidator(String? v) {
    if (v == null || v.trim().isEmpty) return 'Enter email';
    final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim());
    return ok ? null : 'Enter a valid email';
  }

  String? phoneValidator(String? v) {
    if (v == null || v.trim().isEmpty) return 'Enter phone number';
    return v.trim().length < 8 ? 'Enter a valid number' : null;
  }

  String? passValidator(String? v) =>
      (v == null || v.length < 6) ? 'Minimum 6 characters' : null;

  String? confirmValidator(String? v) =>
      (v != passCtrl.text) ? 'Passwords do not match' : null;

  Future<void> submit(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    loading = true;
    notifyListeners();

    // TODO: call your usecase/API here
    await Future.delayed(const Duration(milliseconds: 900));

    loading = false;
    notifyListeners();
    // TODO: Navigate to home or verify screen
    // Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passCtrl.dispose();
    cpassCtrl.dispose();
    super.dispose();
  }
}
