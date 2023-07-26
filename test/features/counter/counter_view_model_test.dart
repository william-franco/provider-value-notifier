// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:provider_value_notifier/src/features/counter/view_models/counter_view_model.dart';

void main() {
  group('CounterViewModel', () {
    late CounterViewModel viewModel;

    setUp(() {
      viewModel = CounterViewModelImpl();
    });

    test('initial value is 0', () {
      expect(viewModel.value, 0);
    });

    test('value should be 1 when increment is called', () {
      viewModel.increment();
      expect(viewModel.value, 1);
    });

    test('value should be 41 when increment is called', () {
      viewModel.value = 40;
      viewModel.increment();
      expect(viewModel.value, 41);
    });

    test('value should be 60 when decrement is called', () {
      viewModel.value = 61;
      viewModel.decrement();
      expect(viewModel.value, 60);
    });

    test('value should be 0 when decrement is called', () {
      viewModel.value = 1;
      viewModel.decrement();
      expect(viewModel.value, 0);
    });

    test('cannot decrement below zero', () {
      viewModel.decrement();
      expect(viewModel.value, 0);
    });
  });
}
