import 'dart:developer';

import 'package:flutter/material.dart';

class CounterViewModel extends ValueNotifier<int> {
  CounterViewModel() : super(0);

  void increment() {
    value++;
    _debug();
    notifyListeners();
  }

  void decrement() {
    value > 0 ? value-- : 0;
    _debug();
    notifyListeners();
  }

  void _debug() {
    log('Counter: $value');
  }
}
