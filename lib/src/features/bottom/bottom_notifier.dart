import 'dart:developer';

import 'package:flutter/material.dart';

class BottomNotifier extends ValueNotifier<int> {
  BottomNotifier() : super(0);

  void updateTab(int index) {
    value = index;
    _debugNotifier();
    notifyListeners();
  }

  void _debugNotifier() {
    log('Current tab: $value');
  }
}
