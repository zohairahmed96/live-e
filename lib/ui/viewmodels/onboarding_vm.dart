import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';

class OnboardingVM {
  void goFeatures(BuildContext context) =>
      Navigator.pushReplacementNamed(context, AppRoutes.features);

  void goPrivacy(BuildContext context) =>
      Navigator.pushReplacementNamed(context, AppRoutes.privacy);
  void goProfile(BuildContext context) =>
      Navigator.pushReplacementNamed(context, AppRoutes.profile);

  void finish(BuildContext context) {
    // TODO: route to real home
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }
}
