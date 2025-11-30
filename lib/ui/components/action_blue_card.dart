import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:sizer/sizer.dart';

class ActionBlueCard extends StatelessWidget {
  final String? icon;
  final Widget? leading;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ActionBlueCard({
    super.key,
    this.icon,
    this.leading,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color blue = AppColor.c3CA4DC; // brand-ish mid blue
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Ink(
        height: ch(98),
        width: cw(370),
        decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cw(10)),
          child: Row(
            children: [
              // left icon in soft square
              Container(
                width: cw(115),
                height: ch(78),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child:
                      leading ??
                      Image.asset(
                        icon ?? "assets/images/carIcon.png",
                        color: Colors.white,
                        width: cw(66),
                        height: ch(53),
                      ),
                ),
                // Icon(icon as IconData?, color: Colors.white, size: 24),
              ),
              SizedBox(width: cw(19)),

              // title + subtitle
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          txt: title,
                          fontWeight: FontWeight.w700,
                          fontSize: AppFontSize.f18,
                          color: AppColor.white,
                          height: 1.5,
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                      ],
                    ),
                    // SizedBox(height: .4.h),
                    AppText(
                      txt: subtitle,
                      fontSize: AppFontSize.f11,
                      color: AppColor.white,
                      height: 1.25,
                    ),
                    // Text(
                    //   subtitle,
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: TextStyle(
                    //     color: Colors.white.withOpacity(.90),
                    //     fontSize: 9.sp,
                    //     height: 1.25,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
