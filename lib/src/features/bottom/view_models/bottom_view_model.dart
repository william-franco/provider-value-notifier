import 'dart:developer';

import 'package:flutter/material.dart';

class BottomViewModel extends ValueNotifier<int> {
  BottomViewModel() : super(0);

  void updateTab(int index) {
    value = index;
    _debug();
    notifyListeners();
  }

  void _debug() {
    log('Current tab: $value');
  }
}
