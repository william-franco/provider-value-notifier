// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:provider_value_notifier/src/features/counter/models/counter_model.dart';

abstract base class CounterViewModel extends ValueNotifier<CounterModel> {
  CounterViewModel() : super(CounterModel());

  void increment();
  void decrement();
}

base class CounterViewModelImpl extends ValueNotifier<CounterModel>
    implements CounterViewModel {
  CounterViewModelImpl() : super(CounterModel());

  @override
  void increment() {
    value.count++;
    _debug();
    notifyListeners();
  }

  @override
  void decrement() {
    value.count--;
    _debug();
    notifyListeners();
  }

  void _debug() {
    log('Counter: ${value.count}');
  }
}
