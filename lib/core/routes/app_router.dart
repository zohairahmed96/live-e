import 'package:flutter/material.dart';
import 'package:liv_e/ui/views/edit_profile_view.dart';
import 'package:liv_e/ui/views/notifications_view.dart';
import 'package:liv_e/ui/views/profile_view.dart' show ProfileView;
import '../../ui/views/launch_view.dart';
import '../../ui/views/logo_splash_view.dart';
import '../../ui/views/onboarding_welcome_view.dart';
import '../../ui/views/onboarding_features_view.dart';
import '../../ui/views/onboarding_private_view.dart';
import 'app_routes.dart';
// import '../../ui/views/notifications/notifications_view.dart';
// import '../../ui/views/profile/edit_profile_view.dart';
// import '../../ui/views/profile/profile_view.dart';
class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.launch:
        return MaterialPageRoute(builder: (_) => const LaunchView());
      case AppRoutes.logo:
        return MaterialPageRoute(builder: (_) => const LogoSplashView());
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => const OnboardingWelcomeView());
      case AppRoutes.features:
        return MaterialPageRoute(
          builder: (_) => const OnboardingFeaturesView(),
        );
      case AppRoutes.privacy:
        return MaterialPageRoute(builder: (_) => const OnboardingPrivateView());
        
case AppRoutes.editProfile:
   return MaterialPageRoute(builder: (_) => const EditProfileView());
        case AppRoutes.profile:
          return MaterialPageRoute(builder: (_) => const ProfileView());
          case AppRoutes.notifications:
            return MaterialPageRoute(builder: (_) => const NotificationsView());
    }
    return null;
  }
}
