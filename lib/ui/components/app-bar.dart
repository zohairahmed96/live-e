import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';

Widget customAppBar({
  // double? appBarHeight,
  // double? appBarWidth,
  // required Widget backButton,
  required Widget title,
  required VoidCallback closeIcon,
}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: ch(80),
    backgroundColor: const Color(0xFFE8F3FF),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColor.c3CA4DC,
      ),
      onPressed: closeIcon,
    ),
    centerTitle: true,
    title: title,
    // AppText(
    //   txt: title,
    //   fontSize: AppFontSize.f22,
    //   fontWeight: FontWeight.w600,
    // ),
  );

  // Container(
  //   color: AppColor.cE8F3FF,
  //   height: appBarHeight ?? 14.28.h,
  //   width: appBarWidth ?? 100.w,
  //   padding: EdgeInsets.only(
  //     left: (10 - 7.6).w,
  //     right: (6.4 - 4.26).w,
  //     top: (2.46).h,
  //   ),
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [backButton, title, closeIcon],
  //   ),
  // );
}
