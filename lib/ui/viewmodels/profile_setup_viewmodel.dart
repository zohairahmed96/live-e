import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/entities/profile_setup_data.dart';

class ProfileSetupViewModel extends ChangeNotifier {
  final picker = ImagePicker();
  String? imagePath;

  // controllers
  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final disabilityCtrl = TextEditingController();
  final caregiverRelationCtrl = TextEditingController();
  final caregiverPhoneCtrl = TextEditingController();
  final caregiverEmailCtrl = TextEditingController();

  // switches
  bool dailyReminders = true;
  bool visualSchedules = true;
  bool emergencyAlerts = true;
  bool caregiverNotifications = true;

  final formKey = GlobalKey<FormState>();
  bool loading = false;

  Future<void> pickImage() async {
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (picked != null) {
      imagePath = picked.path;
      notifyListeners();
    }
  }

  void toggleSwitch(String type, bool value) {
    switch (type) {
      case 'dailyReminders':
        dailyReminders = value;
        break;
      case 'visualSchedules':
        visualSchedules = value;
        break;
      case 'emergencyAlerts':
        emergencyAlerts = value;
        break;
      case 'caregiverNotifications':
        caregiverNotifications = value;
        break;
    }
    notifyListeners();
  }

  String? _notEmpty(String? v, String field) =>
      (v == null || v.trim().isEmpty) ? 'Enter $field' : null;

  Future<void> submit(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // simulate API delay

    loading = false;
    notifyListeners();

    final profile = ProfileSetupData(
      fullName: nameCtrl.text.trim(),
      age: int.tryParse(ageCtrl.text.trim()) ?? 0,
      email: emailCtrl.text.trim(),
      disability: disabilityCtrl.text.trim(),
      caregiverRelation: caregiverRelationCtrl.text.trim(),
      caregiverPhone: caregiverPhoneCtrl.text.trim(),
      caregiverEmail: caregiverEmailCtrl.text.trim(),
      dailyReminders: dailyReminders,
      visualSchedules: visualSchedules,
      emergencyAlerts: emergencyAlerts,
      caregiverNotifications: caregiverNotifications,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile setup completed for ${profile.fullName}'),
      ),
    );

    Navigator.pop(context); // or navigate next
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    ageCtrl.dispose();
    emailCtrl.dispose();
    disabilityCtrl.dispose();
    caregiverRelationCtrl.dispose();
    caregiverPhoneCtrl.dispose();
    caregiverEmailCtrl.dispose();
    super.dispose();
  }
}
