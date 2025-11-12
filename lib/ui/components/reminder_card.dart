import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReminderCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String time;
  final bool enabled;
  final ValueChanged<bool> onChanged;
  final Color borderColor;

  const ReminderCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.time,
    required this.enabled,
    required this.onChanged,
    this.borderColor = const Color(0xFFE6E6E6),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.4.h),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 18.w,
              height: 9.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 3.8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11.sp,
                        color: const Color(0xFF0B101B))),
                SizedBox(height: 0.4.h),
                Text(time,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black54,
                    )),
              ],
            ),
          ),
          Switch.adaptive(
            value: enabled,
            onChanged: onChanged,
            activeColor: const Color(0xFF3CA4DC),
          ),
        ],
      ),
    );
  }
}
