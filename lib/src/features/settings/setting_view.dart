import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_value_notifier/src/features/settings/setting_notifier.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeNotifier>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            RadioListTile<ThemeMode>(
              title: const Text('Light Mode'),
              groupValue: theme.value,
              value: ThemeMode.light,
              onChanged: (value) {
                context.read<ThemeNotifier>().updateThemeMode(value);
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Dark Mode'),
              groupValue: theme.value,
              value: ThemeMode.dark,
              onChanged: (value) {
                context.read<ThemeNotifier>().updateThemeMode(value);
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('System Mode'),
              groupValue: theme.value,
              value: ThemeMode.system,
              onChanged: (value) {
                context.read<ThemeNotifier>().updateThemeMode(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
