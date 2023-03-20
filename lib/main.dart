import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_value_notifier/src/dependency_injector/dependency_injector.dart';
import 'package:provider_value_notifier/src/features/settings/setting_notifier.dart';
import 'package:provider_value_notifier/src/routes/routes.dart';

void main() {
  runApp(
    const DependencyInjector(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Provider ValueNotifier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: context.watch<ThemeNotifier>().value,
      routerConfig: routesApp.routes,
    );
  }
}
