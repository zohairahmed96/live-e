import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
    required this.title,
    required this.right, // any trailing widget (switch / slider / text)
  });

  final String title;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.8.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16, // spec: 16
                color: Color(0xFF000000),
              ),
            ),
          ),
          right,
        ],
      ),
    );
  }
}
