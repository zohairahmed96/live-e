import 'package:flutter/material.dart';
import 'package:liv_e/ui/viewmodels/onboarding_vm.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/image_paths.dart';
// import '../../viewmodels/onboarding_vm.dart';
import '../OnboardingTemplate.dart';

class OnboardingPrivateView extends StatelessWidget {
  const OnboardingPrivateView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = OnboardingVM();
    return OnboardingTemplate(
      image: ImagePaths.privacySecure,
      title: Constants.privacyTitle,
      subtitle: Constants.privacySub,
      // onNext: () => {},
      //  Navigator.pushNamed(context, AppRoutes.login),
      onNext: () => vm.finish(context),
      index: 2,
      isButton: true,
    );
  }
}
