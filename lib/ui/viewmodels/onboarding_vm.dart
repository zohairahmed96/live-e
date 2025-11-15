import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';

class OnboardingVM {
  void goFeatures(BuildContext context) =>
      Navigator.pushNamed(context, AppRoutes.features);

  void goPrivacy(BuildContext context) =>
      // Navigator.pushNamed(context, AppRoutes.privacy);
      Navigator.pushNamed(context, AppRoutes.settings);

  void goProfile(BuildContext context) =>
      // Navigator.pushReplacementNamed(context, AppRoutes.profile);
      Navigator.pushNamed(context, AppRoutes.profile);

  void finish(BuildContext context) {
    // Navigator.pushReplacementNamed(context, AppRoutes.home);
    Navigator.pushNamed(context, AppRoutes.home);
  }

  void goReminder(BuildContext context) =>
      Navigator.pushReplacementNamed(context, AppRoutes.dailyRoutine);
  void goHealthWellness(BuildContext context) =>
      Navigator.pushReplacementNamed(context, AppRoutes.healthWellness);
}
