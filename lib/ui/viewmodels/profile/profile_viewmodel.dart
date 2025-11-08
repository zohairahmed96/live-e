import 'package:flutter/material.dart';
// import '../../../core/routes/app_routes.dart';

class ProfileViewModel extends ChangeNotifier {
  // fake user (replace with domain/entity later)
  String name = 'Jill Powell';
  String email = 'ex@example.com';

  bool location = true;
  bool privacy = true;
  bool notifications = true;

  void toggleLocation(bool v) { location = v; notifyListeners(); }
  void togglePrivacy(bool v) { privacy = v; notifyListeners(); }
  void toggleNotifications(bool v) { notifications = v; notifyListeners(); }

  // void editProfile(BuildContext ctx) {
  //   Navigator.pushNamed(ctx, AppRoutes.profileSetup);
  // }

  // Future<void> logout(BuildContext ctx) async {
  //   // TODO: clear tokens/preferences
  //   ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(content: Text('Logged out')));
  //   Navigator.pushNamedAndRemoveUntil(ctx, AppRoutes.L, (r) => false);
  // }
}
