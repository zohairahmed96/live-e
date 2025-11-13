// lib/ui/components/white_action_row.dart
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WhiteActionRow extends StatelessWidget {
  final Widget leading;
  final String title;
  final VoidCallback? onTap;
  const WhiteActionRow({super.key, required this.leading, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 3.6.w, vertical: 1.6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE6E6E6)),
        ),
        child: Row(
          children: [
            Container(
              width: 46, height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF6FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: leading),
            ),
            SizedBox(width: 3.6.w),
            Expanded(
              child: Text(title,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 11.sp, color: const Color(0xFF0B101B))),
            ),
          ],
        ),
      ),
    );
  }
}
