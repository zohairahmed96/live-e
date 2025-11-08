import '../entities/app_config.dart';
import '../repositories/app_config_repository.dart';

class GetAppConfig {
  final AppConfigRepository repository;
  GetAppConfig(this.repository);

  Future<AppConfig> call() => repository.getConfig();
}
