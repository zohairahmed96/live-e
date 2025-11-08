import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetupViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  String? disability;

  final cgRelationCtrl = TextEditingController();
  final cgPhoneCtrl = TextEditingController();
  final cgEmailCtrl = TextEditingController();

  bool dailyReminders = true;
  bool visualSchedules = true;
  bool emergencyAlerts = true;
  bool caregiverNotifications = true;

  // ✅ working upload
  final ImagePicker _picker = ImagePicker();
  String? photoPath;

  bool loading = false;

  Future<void> pickImage() async {
    final x = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (x != null) {
      photoPath = x.path;
      notifyListeners();
    }
  }

  // validators (public so views can use)
  String? notEmpty(String? v, String field) =>
      (v == null || v.trim().isEmpty) ? 'Enter $field' : null;

  String? emailValidator(String? v) {
    if (v == null || v.trim().isEmpty) return 'Enter email';
    final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim());
    return ok ? null : 'Enter a valid email';
  }

  String? phoneValidator(String? v) =>
      (v == null || v.trim().length < 8) ? 'Enter a valid phone' : null;

  Future<void> submit(BuildContext ctx) async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    loading = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 700));
    loading = false;
    notifyListeners();
    ScaffoldMessenger.of(
      ctx,
    ).showSnackBar(const SnackBar(content: Text('Profile saved')));
    Navigator.pop(ctx); // or push to next route
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    ageCtrl.dispose();
    emailCtrl.dispose();
    cgRelationCtrl.dispose();
    cgPhoneCtrl.dispose();
    cgEmailCtrl.dispose();
    super.dispose();
  }
}
