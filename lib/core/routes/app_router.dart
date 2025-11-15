import 'package:flutter/material.dart';
import 'package:liv_e/ui/views/auth/login_view.dart';
import 'package:liv_e/ui/views/auth/reset_password_view.dart';
import 'package:liv_e/ui/views/dashboard/financial_management_view.dart';
import 'package:liv_e/ui/views/dashboard/bill_reminders_view.dart';
import 'package:liv_e/ui/views/dashboard/set_reminder_view.dart';
import 'package:liv_e/ui/views/dashboard/spending_overview_view.dart';
import 'package:liv_e/ui/views/dashboard/transport_assistance_view.dart';
import 'package:liv_e/ui/views/profile/edit_profile_view.dart';
import 'package:liv_e/ui/views/settings/privacy_policy_view.dart';
import 'package:liv_e/ui/views/settings/settings_view.dart';
import 'package:liv_e/ui/views/splash/notifications_view.dart';
import 'package:liv_e/ui/views/profile/profile_setup_view.dart';
import 'package:liv_e/ui/views/profile/profile_view.dart';
import 'package:liv_e/ui/views/dashboard/daily_routine_view.dart';
import 'package:liv_e/ui/views/dashboard/health_wellness_view.dart';
import '../../ui/views/launch_view.dart';
import '../../ui/views/logo_splash_view.dart';
import '../../ui/views/splash/onboarding_welcome_view.dart';
import '../../ui/views/splash/onboarding_features_view.dart';
import '../../ui/views/splash/onboarding_private_view.dart';
import '../../ui/views/auth/signup_view.dart';
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
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case AppRoutes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());

      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case AppRoutes.profileSetup:
        return MaterialPageRoute(builder: (_) => const ProfileSetupView());
      case AppRoutes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsView());
      case AppRoutes.transport:
        return MaterialPageRoute(
          builder: (_) => const TransportAssistanceView(),
        );
      case AppRoutes.financial:
        return MaterialPageRoute(
          builder: (_) => const FinancialManagementView(),
        );
      case AppRoutes.billReminders:
        return MaterialPageRoute(builder: (_) => const BillRemindersView());

      case AppRoutes.setReminder:
        return MaterialPageRoute(builder: (_) => const SetReminderView());

      case AppRoutes.spendingOverview:
        return MaterialPageRoute(builder: (_) => const SpendingOverviewView());
      case AppRoutes.dailyRoutine:
        return MaterialPageRoute(builder: (_) => const DailyRoutineView());
      case AppRoutes.healthWellness:
        return MaterialPageRoute(builder: (_) => const HealthWellnessView());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsView());
      case AppRoutes.privacyPolicy:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyView());
    }

    return null;
  }
}
