import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:sizer/sizer.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
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
    this.borderColor,
    this.buttonColor,
    this.textDecoration,
    this.borderRadius,
  }) : super(key: key);

  final String? text;
  final TextStyle? textStyle;
  final Function onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Decoration? buttonStyle;
  final bool isLoading;
  final Widget? child;
  final Color? borderColor;
  final double? borderRadius;
  final Color? buttonColor;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isLoading ? null : onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        height: (height ?? 6.77.h),
        width: (width ?? 82.93.w),
        child: child != null
            ? child!
            : Text(
                text!,
                style:
                    textStyle ??
                    TextStyle(
                      fontSize: fontSize ?? AppFontSize.f14,
                      color: AppColor.black,
                      fontFamily: "Gotham",
                      fontWeight: fontWeight ?? FontWeight.w400,
                      decoration: textDecoration ?? TextDecoration.none,
                    ),
              ),
        decoration:
            buttonStyle ??
            BoxDecoration(
              color: buttonColor ?? AppColor.white,
              borderRadius: BorderRadius.circular(borderRadius ?? (5.07).h),
              border: Border.all(
                width: (0.266).w,
                color: borderColor ?? AppColor.black,
              ),
            ),
      ),
    );
  }
}
