import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/image_paths.dart';

class AppLogo extends StatelessWidget {
  final double widthW; // percent of width
  const AppLogo({super.key, this.widthW = 22});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthW.w,
      child: SvgPicture.asset(ImagePaths.logo, fit: BoxFit.contain),
    );
  }
}
