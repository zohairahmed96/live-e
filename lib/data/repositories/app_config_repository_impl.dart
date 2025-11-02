import '../../domain/entities/app_config.dart';
import '../../domain/repositories/app_config_repository.dart';
import '../datasources/remote_config_service.dart';

class AppConfigRepositoryImpl implements AppConfigRepository {
  final RemoteConfigService remote;

  AppConfigRepositoryImpl(this.remote);

  @override
  Future<AppConfig> getConfig() => remote.fetch();
}
