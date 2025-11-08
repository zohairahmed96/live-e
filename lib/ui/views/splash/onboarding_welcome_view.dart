import 'package:flutter/material.dart';
import 'package:liv_e/ui/views/OnboardingTemplate.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/image_paths.dart';
import '../../viewmodels/onboarding_vm.dart';

class OnboardingWelcomeView extends StatelessWidget {
  const OnboardingWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = OnboardingVM();

    return OnboardingTemplate(
      image: ImagePaths.welcome,
      title: Constants.welcomeTitle,
      subtitle: Constants.welcomeSub,
      onNext: () => vm.goFeatures(context),
      showCTA: true,
      index: 1,
    );
  }
}
