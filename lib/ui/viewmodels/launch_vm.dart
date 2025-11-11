import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';

class LaunchVM {
  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 800));
    // Navigator.pushReplacementNamed(context, AppRoutes.logo);
    Navigator.pushNamed(context, AppRoutes.logo);
  }
}
