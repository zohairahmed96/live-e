import 'package:flutter/material.dart';
import '../../core/themes/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const GradientScaffold({
    super.key,
    required this.child,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.bgTop, AppColors.bgBottom],
        ),
      ),
      child: SafeArea(
        child: Scaffold(backgroundColor: Colors.transparent, body: child),
      ),
    );
  }
}
