import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_value_notifier/src/features/bottom/bottom_notifier.dart';
import 'package:provider_value_notifier/src/features/counter/counter_notifier.dart';
import 'package:provider_value_notifier/src/features/items/item_notifier.dart';
import 'package:provider_value_notifier/src/features/settings/setting_notifier.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;
  final ThemeNotifier themeNotifier;

  const DependencyInjector({
    super.key,
    required this.child,
    required this.themeNotifier,
  });

  @override
  Widget build(BuildContext context) {
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
          create: (context) => themeNotifier,
        ),
      ],
      child: child,
    );
  }
}
