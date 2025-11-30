import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:sizer/sizer.dart';

class LightBlueButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const LightBlueButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bg = const Color(0xFFE4F6FF); // #E4F6FF
    final fg = const Color(0xFF3CA4DC); // #3CA4DC
    return SizedBox(
      width: double.infinity,
      height: 6.2.h,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 11.sp),
        ),
        onPressed: onPressed,
        child: AppText(
          txt: label,
          fontSize: AppFontSize.f18,
          fontWeight: FontWeight.w600,
          color: AppColor.c3CA4DC,
        ),
      ),
    );
  }
}
