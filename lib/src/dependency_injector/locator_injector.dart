// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:provider_value_notifier/src/features/settings/repositories/setting_repository.dart';
import 'package:provider_value_notifier/src/services/storage_service.dart';

final locator = GetIt.instance;

void locatorInjector() {
  startModuleSettings();
}

void startModuleSettings() {
  // Services
  locator.registerFactory<StorageService>(
    () => StorageServiceImpl(),
  );
  // Repositories
  locator.registerFactory<SettingRepository>(
    () => SettingRepositoryImpl(
      storageService: locator<StorageService>(),
    ),
  );
}
