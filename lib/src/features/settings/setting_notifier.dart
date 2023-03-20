import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_value_notifier/src/storage/storage_service.dart';

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier(this._storage) : super(_storage.theme) {
    _loadTheme();
  }

  final StorageService _storage;

  Future<void> _loadTheme() async {
    value = await _storage.getThemeMode();
    _debugNotifier();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == value) return;

    value = newThemeMode;

    await _storage.setThemeMode(newThemeMode);

    _debugNotifier();
    notifyListeners();
  }

  void _debugNotifier() {
    log('Theme: $value');
  }
}

// Exmaple with ChangeNotifier
// class ThemeNotifier2 with ChangeNotifier {
//   ThemeNotifier2(this._storage);

//   final StorageService _storage;

//   late ThemeMode _themeMode;
//   ThemeMode get themeMode => _themeMode;

//   Future<void> loadSettings() async {
//     _themeMode = await _storage.getThemeMode();
//     notifyListeners();
//   }

//   Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
//     if (newThemeMode == null) return;

//     if (newThemeMode == _themeMode) return;

//     _themeMode = newThemeMode;

//     await _storage.setThemeMode(newThemeMode);

//     notifyListeners();
//   }
// }
