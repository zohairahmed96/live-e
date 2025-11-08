// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import '../../core/themes/app_text_styles.dart';
// import '../../core/utils/constants.dart';
// import '../components/app_logo.dart';
// import '../components/gradient_scaffold.dart';
// import '../components/primary_button.dart';
// import '../viewmodels/splash_viewmodel.dart';

// class SplashView extends StatelessWidget {
//   const SplashView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SplashViewModel()..init(),
//       child: const _SplashBody(),
//     );
//   }
// }

// class _SplashBody extends StatelessWidget {
//   const _SplashBody();

//   @override
//   Widget build(BuildContext context) {
//     return GradientScaffold(
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           return Stack(
//             fit: StackFit.expand,
//             children: [
//               // Background hero image aligned to top (keeps the brand feel)
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 3.h),
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(maxHeight: 40.h),
//                     child: Image.asset(
//                       'assets/images/hero.jpg',
//                       fit: BoxFit.cover,
//                       width: 90.w,
//                     ),
//                   ),
//                 ),
//               ),

//               // Foreground content
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(6.w, 0, 6.w, 4.h),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const AppLogo(size: 18),
//                       SizedBox(height: 2.5.h),

//                       Text(
//                         'Welcome to LiV-E!',
//                         style: AppTextStyles.headline(),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 1.2.h),
//                       Text(
//                         Constants.tagLine,
//                         style: AppTextStyles.subtitle(),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 3.5.h),

//                       PrimaryButton(
//                         label: Constants.cta,
//                         onPressed: () {
//                           // TODO: navigate to onboarding or home
//                           // context.go(AppRoutes.onboarding);
//                         },
//                       ),

//                       SizedBox(height: 2.0.h),

//                       // A small page indicator (static on splash)
//                       Container(
//                         width: 20.w,
//                         height: 0.8.h,
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.25),
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
