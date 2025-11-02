import '../../domain/entities/app_config.dart';

class RemoteConfigService {
  Future<AppConfig> fetch() async {
    // Placeholder for API/Remote Config. Keep async for future extension.
    await Future.delayed(const Duration(milliseconds: 150));
    return const AppConfig(showOnboarding: true);
  }
}
