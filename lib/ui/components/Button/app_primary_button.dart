import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';

import 'package:flutter/material.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.child,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.buttonStyle,
    this.color,
    this.buttonColor,
    this.textDecoration,
    this.textAlign,
    this.borderRadius,
    this.isGradient = false,
  }) : super(key: key);

  final String? text;
  final Widget? child;
  final TextStyle? textStyle;
  final Function onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final BoxDecoration? buttonStyle;
  final bool isLoading;
  final Color? color;
  final Color? buttonColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final double? borderRadius;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isLoading ? null : onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        width: (width ?? 82.93.w),
        height: (height ?? (6.77).h),
        child: AppText(
          txt: text!,
          textAlign: textAlign ?? TextAlign.center,
          fontSize: fontSize ?? AppFontSize.f16,
          color: color ?? AppColor.white,
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
        decoration:
            buttonStyle ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? (4.07).h),
              color: buttonColor ?? AppColor.cB4F922,
            ),
      ),
    );
  }
}
