import '../entities/app_config.dart';

abstract class AppConfigRepository {
  Future<AppConfig> getConfig();
}
