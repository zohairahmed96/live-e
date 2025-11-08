import 'package:flutter/material.dart';
import 'package:liv_e/core/routes/app_routes.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/image_paths.dart';
// import '../../viewmodels/onboarding_vm.dart';
import '../OnboardingTemplate.dart';

class OnboardingPrivateView extends StatelessWidget {
  const OnboardingPrivateView({super.key});

  @override
  Widget build(BuildContext context) {
    // final vm = OnboardingVM();
    return OnboardingTemplate(
      image: ImagePaths.private,
      title: Constants.privacyTitle,
      subtitle: Constants.privacySub,
      index: 2,

      onNext: () => Navigator.pushNamed(context, AppRoutes.login),
      // onNext: () => vm.finish(context),
      showCTA: true, // shows "Get Started" full-width button
    );
  }
}
