import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChoreTile extends StatelessWidget {
  final Widget leading; // svg/png/icon
  final String title;
  final bool done;
  final ValueChanged<bool> onChanged;

  const ChoreTile({
    super.key,
    required this.leading,
    required this.title,
    required this.done,
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
        border: Border.all(color: const Color(0x14000000)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF6FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: leading),
          ),
          SizedBox(width: 3.6.w),
          Expanded(
            child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                    color: const Color(0xFF0B101B))),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => onChanged(!done),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: done ? const Color(0xFF3CA4DC) : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFF3CA4DC),
                  width: 1.4,
                ),
              ),
              child: Icon(Icons.check,
                  size: 18,
                  color: done ? Colors.white : const Color(0xFF3CA4DC)),
            ),
          ),
        ],
      ),
    );
  }
}
