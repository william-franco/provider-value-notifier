// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

abstract base class CounterViewModel extends ValueNotifier<int> {
  CounterViewModel() : super(0);

  void increment();
  void decrement();
}

base class CounterViewModelImpl extends ValueNotifier<int>
    implements CounterViewModel {
  CounterViewModelImpl() : super(0);

  @override
  void increment() {
    value++;
    _debug();
    notifyListeners();
  }

  @override
  void decrement() {
    value > 0 ? value-- : 0;
    _debug();
    notifyListeners();
  }

  void _debug() {
    log('Counter: $value');
  }
}
