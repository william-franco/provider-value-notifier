import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_value_notifier/src/features/bottom/bottom_notifier.dart';
import 'package:provider_value_notifier/src/features/counter/counter_notifier.dart';
import 'package:provider_value_notifier/src/features/items/item_notifier.dart';
import 'package:provider_value_notifier/src/features/settings/setting_notifier.dart';
import 'package:provider_value_notifier/src/storage/storage_service.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final service = StorageService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => CounterNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ItemsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier(service),
        ),
      ],
      child: child,
    );
  }
}
