// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:provider_value_notifier/src/dependency_injector/dependency_injector.dart';
import 'package:provider_value_notifier/src/features/settings/view_models/setting_view_model.dart';
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
    final viewModel = context.watch<SettingViewModel>();
    return MaterialApp.router(
      title: 'Provider ValueNotifier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: viewModel.value.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      routerConfig: routesApp.routes,
    );
  }
}
