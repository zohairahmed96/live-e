import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class EditProfileViewModel extends ChangeNotifier {
  final nameCtrl  = TextEditingController(text: 'Jill Powell');
  final emailCtrl = TextEditingController(text: 'ex@example.com');
  final ageCtrl   = TextEditingController(text: '25');
  final disabilityCtrl = TextEditingController(text: 'No');

  final formKey = GlobalKey<FormState>();
  // final _picker = ImagePicker();
  String? photoPath;
  bool saving = false;

  // Future<void> pickImage() async {
  //   final x = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
  //   if (x != null) { photoPath = x.path; notifyListeners(); }
  // }

  String? notEmpty(String? v, String label) =>
      (v == null || v.trim().isEmpty) ? 'Enter $label' : null;

  String? emailValidator(String? v) {
    if (v == null || v.trim().isEmpty) return 'Enter email';
    final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim());
    return ok ? null : 'Enter a valid email';
  }

  Future<void> save(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    saving = true; notifyListeners();

    // TODO: call usecase/repository to persist profile
    await Future.delayed(const Duration(milliseconds: 800));

    saving = false; notifyListeners();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Profile updated')));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameCtrl.dispose(); emailCtrl.dispose(); ageCtrl.dispose(); disabilityCtrl.dispose();
    super.dispose();
  }
}
