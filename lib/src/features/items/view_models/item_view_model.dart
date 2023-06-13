// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

abstract base class ItemsViewModel extends ValueNotifier<List<int>> {
  ItemsViewModel() : super([]);

  void addItemToList();
  void removeItemFromList();
  void removeAllItems();
}

base class ItemsViewModelImpl extends ValueNotifier<List<int>>
    implements ItemsViewModel {
  ItemsViewModelImpl() : super([]);

  int _count = 0;

  @override
  void addItemToList() {
    _count++;
    value.add(_count);
    _debug();
    notifyListeners();
  }

  @override
  void removeItemFromList() {
    _count > 0 ? _count-- : 0;
    value.isNotEmpty ? value.removeLast() : 0;
    _debug();
    notifyListeners();
  }

  @override
  void removeAllItems() {
    _count = 0;
    value.clear();
    _debug();
    notifyListeners();
  }

  void _debug() {
    log('List item: ${value.length}');
  }
}
