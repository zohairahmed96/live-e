// lib/ui/views/_onboarding_template.dart
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/themes/app_text_styles.dart';
import '../components/page_indicator.dart';

class OnboardingTemplate extends StatelessWidget {
  final String image; // Image.asset or SvgPicture
  final String title;
  final String subtitle;
  final int index; // 0,1,2 for indicator
  final VoidCallback onNext;
  final bool showCTA;

  const OnboardingTemplate({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.index,
    required this.onNext,
    this.showCTA = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// 1️⃣ IMAGE AS BACKGROUND (covers full screen)
          Image.asset(
            // ImagePaths.welcome,
            image,
            fit: BoxFit.cover,
            alignment: const Alignment(0, -0.05),
          ),
          // Positioned.fill(child: image),

          /// 2️⃣ GRADIENT OVERLAY (from transparent → blue)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0x33000000), // slight dark fade on image
                  Color(0x803B83E6), // blue tint
                  Color(0xFF2D6DD6), // solid brand blue at bottom
                ],
                stops: [0.0, 0.4, 0.65, 1.0],
              ),
            ),
          ),

          /// 3️⃣ TEXT + BUTTON + INDICATOR
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(7.w, 0, 7.w, 5.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const PageIndicator(index: 0),
                  SizedBox(height: 2.h),

                  Text(
                    title,
                    // Constants.welcomeTitle,
                    style: AppTextStyles.h1(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 1.2.h),

                  Text(
                    subtitle,
                    // Constants.welcomeSub,
                    style: AppTextStyles.body(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 3.h),

                  /// round button (white → blue)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF2D6DD6),
                      shape: const CircleBorder(),
                      padding: EdgeInsets.all(2.2.h),
                      elevation: 0,
                    ),
                    onPressed: onNext,
                    child: const Icon(Icons.arrow_forward_rounded, size: 26),
                  ),

                  SizedBox(height: 1.8.h),

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
