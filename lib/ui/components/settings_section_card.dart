import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';

class SettingsSectionCard extends StatelessWidget {
  const SettingsSectionCard({super.key, this.height, required this.child});

  final double? height;
  final Widget child;

  static const Color kCard = Color(0xFFE4F6FF);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // height already computed via Sizer in view
      width: cw(370),
      decoration: BoxDecoration(
        color: kCard, // #E4F6FF
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}
