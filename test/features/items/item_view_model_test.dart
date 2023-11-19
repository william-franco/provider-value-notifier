// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:provider_value_notifier/src/features/items/view_models/item_view_model.dart';

void main() {
  group('ItemsViewModelImpl', () {
    late ItemsViewModel viewModel;

    setUp(() {
      viewModel = ItemsViewModelImpl();
    });

    test('addItemToList should update the model correctly', () {
      viewModel.addItemToList();

      expect(viewModel.value.count, equals(1));
      expect(viewModel.value.items, equals([1]));
    });

    test('removeItemFromList should update the model correctly on count > 0',
        () {
      viewModel.addItemToList();
      viewModel.removeItemFromList();

      expect(viewModel.value.count, equals(0));
      expect(viewModel.value.items, equals([]));
    });

    test('removeItemFromList should update the model correctly on count = 0',
        () {
      viewModel.removeItemFromList();

      expect(viewModel.value.count, equals(0));
      expect(viewModel.value.items, equals([]));
    });

    test('removeAllItems should update the model correctly', () {
      viewModel.addItemToList();
      viewModel.removeAllItems();

      expect(viewModel.value.count, equals(0));
      expect(viewModel.value.items, equals([]));
    });
  });
}
