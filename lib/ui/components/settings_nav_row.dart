import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsNavRow extends StatelessWidget {
  const SettingsNavRow({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFF7A8A9A)),
          ],
        ),
      ),
    );
  }
}
