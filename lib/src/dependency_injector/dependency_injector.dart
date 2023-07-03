// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
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
        Provider<StorageService>(
          create: (context) => StorageServiceImpl(),
        ),
        // Repositories
        Provider<SettingRepository>(
          create: (context) => SettingRepositoryImpl(
            storageService: context.read<StorageService>(),
          ),
        ),
        // ViewModels
        ChangeNotifierProvider<BottomViewModel>(
          create: (context) => BottomViewModelImpl(),
        ),
        ChangeNotifierProvider<CounterViewModel>(
          create: (context) => CounterViewModelImpl(),
        ),
        ChangeNotifierProvider<ItemsViewModel>(
          create: (context) => ItemsViewModelImpl(),
        ),
        ChangeNotifierProvider<SettingViewModel>(
          create: (context) => SettingViewModelImpl(
            settingRepository: context.read<SettingRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
