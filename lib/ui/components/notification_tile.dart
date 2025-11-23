import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:sizer/sizer.dart';
import '../../domain/entities/notification_item.dart';

class NotificationTile extends StatelessWidget {
  final NotificationItem item;
  const NotificationTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ch(82),
      width: cw(368),
      padding: EdgeInsets.only(
        left: cw(13),
        right: cw(18),
        top: ch(13.5),
        bottom: ch(13.5),
      ),
      decoration: BoxDecoration(
        color: AppColor.c3CA4DC.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.c3CA4DC),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // avatar
          Container(
            width: cw(55),
            height: ch(55),
            child: Image.asset(item.image),
          ),
          SizedBox(width: cw(5.5)),
          // name + subtitle
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  txt: item.name,
                  fontSize: AppFontSize.f16,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
                // Text(
                //   item.name,
                //   overflow: TextOverflow.ellipsis,
                //   style: TextStyle(
                //     fontWeight: FontWeight.w600,
                //     fontSize: 11.sp,
                //     color: const Color(0xFF0B101B),
                //   ),
                // ),
                AppText(
                  txt: item.subtitle,
                  fontSize: AppFontSize.f14,
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
          ),

          // time (blue)
          AppText(
            txt: item.time,
            fontWeight: FontWeight.w500,
            fontSize: AppFontSize.f16,
            color: AppColor.c2D6DD6,
          ),
        ],
      ),
    );
  }
}
