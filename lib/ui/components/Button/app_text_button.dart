import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:sizer/sizer.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.buttonStyle,
    this.textColor,
    this.underline = false, // NEW
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final Function onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final ButtonStyle? buttonStyle;
  final bool isLoading;
  final Color? textColor;

  final bool underline; // NEW

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        text,
        style:
            textStyle ??
            TextStyle(
              fontSize: fontSize ?? AppFontSize.f14,
              color: textColor ?? AppColor.black,
              height: height ?? 1,
              fontFamily: 'Gotham',
              fontWeight: fontWeight ?? FontWeight.w400,
              decoration: underline
                  ? TextDecoration.underline
                  : TextDecoration.none, // NEW
            ),
      ),
      onTap: () => isLoading ? null : onPressed(),
    );
  }
}
