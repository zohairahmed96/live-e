import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../domain/entities/notification_item.dart';

class NotificationTile extends StatelessWidget {
  final NotificationItem item;
  const NotificationTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.2.h,
      padding: EdgeInsets.symmetric(horizontal: 3.6.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0x11000000)),
        boxShadow: [BoxShadow(color: Colors.black12.withOpacity(.05), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          // avatar
          Container(
            width: 42, height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF6FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.person, color: Color(0xFF2D6DD6), size: 22),
          ),
          SizedBox(width: 3.6.w),

          // name + subtitle
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp, color: const Color(0xFF0B101B))),
                SizedBox(height: .2.h),
                Text(item.subtitle,
                    style: TextStyle(fontSize: 9.sp, color: Colors.black45), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),

          // time (blue)
          Text(item.time,
              style: TextStyle(
                color: const Color(0xFF2D6DD6),
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
              )),
        ],
      ),
    );
  }
}
