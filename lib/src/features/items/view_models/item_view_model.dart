// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:provider_value_notifier/src/features/items/models/item_model.dart';

abstract base class ItemsViewModel extends ValueNotifier<ItemsModel> {
  ItemsViewModel() : super(ItemsModel());

  void addItemToList();
  void removeItemFromList();
  void removeAllItems();
}

base class ItemsViewModelImpl extends ValueNotifier<ItemsModel>
    implements ItemsViewModel {
  ItemsViewModelImpl() : super(ItemsModel());

  @override
  void addItemToList() {
    value.count++;
    value.items.add(value.count);
    _debug();
    notifyListeners();
  }

  @override
  void removeItemFromList() {
    value.count > 0 ? value.count-- : 0;
    value.items.isNotEmpty ? value.items.removeLast() : 0;
    _debug();
    notifyListeners();
  }

  @override
  void removeAllItems() {
    value.count = 0;
    value.items.clear();
    _debug();
    notifyListeners();
  }

  void _debug() {
    log('List item: ${value.items.length}');
  }
}
