import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';

class LogoVM {
  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // Navigator.pushReplacementNamed(context, AppRoutes.welcome);
    Navigator.pushNamed(context, AppRoutes.welcome);
  }
}
