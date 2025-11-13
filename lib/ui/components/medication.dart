// lib/ui/components/medication_tile.dart
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MedicationTile extends StatelessWidget {
  final IconData icon;
  final String timeLabel;
  final bool value;
  final ValueChanged<bool> onChanged;

  const MedicationTile({
    super.key,
    required this.icon,
    required this.timeLabel,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.2.h),
      padding: EdgeInsets.symmetric(horizontal: 3.6.w, vertical: 1.4.h),
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
            child: Icon(icon, color: const Color(0xFF3CA4DC), size: 24),
          ),
          SizedBox(width: 3.6.w),
          Text(timeLabel,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 11.sp,
                color: const Color(0xFF0B101B),
              )),
          const Spacer(),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF3CA4DC),
          ),
        ],
      ),
    );
  }
}
