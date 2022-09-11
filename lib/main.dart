import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_value_notifier/src/dependency_injector/dependency_injector.dart';
import 'package:provider_value_notifier/src/features/bottom/bottom_view.dart';
import 'package:provider_value_notifier/src/features/settings/setting_notifier.dart';
import 'package:provider_value_notifier/src/storage/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeNotifier = ThemeNotifier(StorageService());

  await themeNotifier.loadTheme();

  runApp(
    DependencyInjector(
      themeNotifier: themeNotifier,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider ValueNotifier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<ThemeNotifier>().value,
      home: const BottomView(),
    );
  }
}
