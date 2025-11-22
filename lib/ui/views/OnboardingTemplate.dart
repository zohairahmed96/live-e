// lib/ui/views/_onboarding_template.dart
import 'package:flutter/material.dart';
import 'package:liv_e/core/utils/helper/app_layout_helper.dart';
import 'package:liv_e/core/utils/helper/color.utils.dart';
import 'package:liv_e/core/utils/helper/font_size.dart';
import 'package:liv_e/ui/components/Button/app_primary_button.dart';
import 'package:liv_e/ui/components/app_text.dart';
import 'package:sizer/sizer.dart';
import '../components/page_indicator.dart';
import "../../core/utils//image_paths.dart";

class OnboardingTemplate extends StatelessWidget {
  final String image; // Image.asset or SvgPicture
  final String title;
  final String subtitle;
  final int index; // 0,1,2 for indicator
  final VoidCallback onNext;
  final bool showCTA;
  final bool isButton;

  const OnboardingTemplate({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.index,
    required this.onNext,
    this.showCTA = false,
    this.isButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            alignment: const Alignment(0, -0.05),
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.transparent,
                  AppColor.c33000000, // slight dark fade on image
                  AppColor.c3B83E6, // blue tint
                  AppColor.c2D6DD6, // solid brand blue at bottom
                ],
                stops: [0.0, 0.4, 0.65, 1.0],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(7.w, 0, 7.w, 5.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PageIndicator(index: index),
                  SizedBox(height: ch(39)),
                  AppText(
                    txt: title,
                    fontSize: AppFontSize.f36,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    color: AppColor.white,
                  ),

                  SizedBox(height: ch(30)),
                  AppText(
                    txt: subtitle,
                    fontSize: AppFontSize.f22,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.center,
                    color: AppColor.white,
                  ),
                  SizedBox(height: ch(67)),

                  /// round button (white → blue)
                  AppButton(
                    onPressed: onNext,
                    buttonStyle: isButton
                        ? null
                        : BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.white,
                            boxShadow: const [],
                          ),

                    buttonColor: isButton ? AppColor.white : null,
                    child: isButton
                        ? AppText(
                            txt: "Get Started",
                            fontFamily: "Montserrat",
                            isGradient: true,
                            fontWeight: FontWeight.w700,
                          )
                        : Image.asset(
                            ImagePaths.backRight,
                            width: cw(16),
                            height: ch(27),
                          ),
                  ),

                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.white,
                  // foregroundColor: const Color(0xFF2D6DD6),
                  // shape: const CircleBorder(),
                  // padding: EdgeInsets.all(2.2.h),
                  // elevation: 0,
                  //     ),
                  //     onPressed: onNext,
                  //     child: const Icon(
                  //       Icons.arrow_forward_rounded,
                  //       size: 26,
                  //     ),
                  //   ),
                  SizedBox(height: ch(49)),

                  /// optional small white bar (iOS home indicator)
                  Container(
                    width: 22.w,
                    height: 0.7.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
