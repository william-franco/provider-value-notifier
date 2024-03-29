// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:provider_value_notifier/src/features/bottom/view_models/bottom_view_model.dart';

void main() {
  group('BottomViewModel', () {
    late BottomViewModel viewModel;

    setUp(() {
      viewModel = BottomViewModelImpl();
    });

    test('initial value is 0', () {
      expect(viewModel.value.indexTab, equals(0));
    });

    test('change index', () {
      viewModel.changeIndexBottom(index: 1);
      expect(viewModel.value.indexTab, equals(1));
    });
  });
}
