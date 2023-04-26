import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_value_notifier/src/features/bottom/view_models/bottom_view_model.dart';
import 'package:provider_value_notifier/src/features/counter/view_models/counter_view_model.dart';
import 'package:provider_value_notifier/src/features/items/view_models/item_view_model.dart';
import 'package:provider_value_notifier/src/features/settings/repositories/setting_repository.dart';
import 'package:provider_value_notifier/src/features/settings/view_models/setting_view_model.dart';
import 'package:provider_value_notifier/src/services/storage_service.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Services
        Provider(
          create: (context) => StorageService(),
        ),
        // Repositories
        Provider(
          create: (context) => SettingRepository(
            storageService: context.read<StorageService>(),
          ),
        ),
        // ViewModels
        ChangeNotifierProvider(
          create: (context) => BottomViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ItemsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingViewModel(
            settingRepository: context.read<SettingRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
