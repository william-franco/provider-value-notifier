// Project imports:
import 'package:provider_value_notifier/src/constants/constants.dart';
import 'package:provider_value_notifier/src/services/storage_service.dart';

class SettingRepository {
  final StorageService storageService;

  SettingRepository({
    required this.storageService,
  });

  Future<bool> readTheme() async {
    final isDarkTheme = await storageService.getBoolValue(
      key: Constants.darkMode,
    );
    return isDarkTheme;
  }

  Future<void> updateTheme({required bool isDarkTheme}) async {
    await storageService.setBoolValue(
      key: Constants.darkMode,
      value: isDarkTheme,
    );
  }
}
