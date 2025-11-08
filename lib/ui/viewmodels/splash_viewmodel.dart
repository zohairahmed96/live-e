import 'package:flutter/foundation.dart';
import '../../data/datasources/remote_config_service.dart';
import '../../data/repositories/app_config_repository_impl.dart';
import '../../domain/usecases/get_app_config.dart';

class SplashViewModel extends ChangeNotifier {
  final GetAppConfig _getConfig;

  SplashViewModel._(this._getConfig);

  factory SplashViewModel() {
    final repo = AppConfigRepositoryImpl(RemoteConfigService());
    return SplashViewModel._(GetAppConfig(repo));
  }

  bool _loading = true;
  bool get loading => _loading;

  Future<void> init() async {
    _loading = true;
    notifyListeners();

    await _getConfig(); // would decide where to go next later

    _loading = false;
    notifyListeners();
  }
}
