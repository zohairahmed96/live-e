import 'package:flutter/material.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/image_paths.dart';
import '../viewmodels/onboarding_vm.dart';
import 'OnboardingTemplate.dart';

class OnboardingFeaturesView extends StatelessWidget {
  const OnboardingFeaturesView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = OnboardingVM();
    return
    // OnboardingTemplate(
    //   image: SvgPicture.asset(ImagePaths.features, fit: BoxFit.contain),
    //   title: Constants.featuresTitle,
    //   subtitle: Constants.featuresSub,
    //   index: 1,
    //   onNext: () => vm.goPrivacy(context),
    // );
    OnboardingTemplate(
      image: ImagePaths.features2,
      // SvgPicture.asset(ImagePaths.features, fit: BoxFit.contain),
      title: Constants.featuresTitle,
      subtitle: Constants.featuresSub,
      onNext: () => vm.goProfile(context),
      showCTA: true,
      index: 1,
    );
  }
}
