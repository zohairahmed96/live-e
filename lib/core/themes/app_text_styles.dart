import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle h1() => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    decoration: TextDecoration.none, // <- no underline ever
    height: 1.2,
  );

  static TextStyle body() => TextStyle(
    fontSize: 11.5.sp,
    height: 1.35,
    color: AppColors.white.withOpacity(.95),
    decoration: TextDecoration.none, // <- no underline
  );

  static TextStyle btn() => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    decoration: TextDecoration.none, // <- no underline
  );
}
