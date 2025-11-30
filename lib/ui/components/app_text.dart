import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText({
    Key? key,
    required this.txt,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.backgroundColor,
    this.fontFamily,
    this.textAlign,
    this.height,
    this.letterspacing,
    this.wordspacing,
    this.decoration,
    this.isGradient = false, // NEW
    this.overFlow,
    this.maxLines,
  }) : super(key: key);

  final String txt;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  Color? backgroundColor;
  String? fontFamily;
  TextAlign? textAlign;
  double? height;
  double? letterspacing;
  double? wordspacing;
  TextDecoration? decoration;
  TextOverflow? overFlow;
  int? maxLines;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    // Gradient Definition
    const gradient = LinearGradient(
      colors: [
        Color(0xFF3CA4DC), // start
        Color(0xFF334EA0), // end
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    // If NOT gradient → return normal Text
    if (!isGradient) {
      return Text(
        txt,
        textAlign: textAlign ?? TextAlign.start,
        overflow: overFlow ?? TextOverflow.ellipsis,
        maxLines: maxLines ?? 2,
        style: TextStyle(
          fontFamily: fontFamily ?? "Poppins",
          fontSize: fontSize ?? AppFontSize.f14,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? AppColor.c3B3B3B,
          backgroundColor: backgroundColor ?? AppColor.transparent,
          height: height ?? 1.0,
          letterSpacing: letterspacing ?? 0,
          wordSpacing: wordspacing ?? 0,
          decoration: decoration ?? TextDecoration.none,
        ),
      );
    }

    // If gradient → use ShaderMask
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        txt,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          fontFamily: fontFamily ?? "Poppins",
          fontSize: fontSize ?? AppFontSize.f14,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: Colors.white, // required for gradient
          backgroundColor: Colors.transparent,
          height: height ?? 1.0,
          letterSpacing: letterspacing ?? 0,
          wordSpacing: wordspacing ?? 0,
          decoration: decoration ?? TextDecoration.none,
        ),
      ),
    );
  }
}
