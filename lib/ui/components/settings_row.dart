import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/ui/components/app_text.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.title,
    required this.right,
    this.horizontal,
    this.vertical,
  });

  final String title;
  final Widget right;
  final double? horizontal;
  final double? vertical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: cw(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            txt: title,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColor.black,
          ),
          right,
        ],
      ),
    );
  }
}
