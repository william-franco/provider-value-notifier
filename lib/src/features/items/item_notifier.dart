import 'dart:developer';

import 'package:flutter/material.dart';

class ItemsNotifier extends ValueNotifier<List<int>> {
  ItemsNotifier() : super([]);

  int _count = 0;

  void addItemToList() {
    _count++;
    value.add(_count);
    _debugProvider();
    notifyListeners();
  }

  void removeItemFromList() {
    _count > 0 ? _count-- : 0;
    value.isNotEmpty ? value.removeLast() : 0;
    _debugProvider();
    notifyListeners();
  }

  void removeAllItems() {
    _count = 0;
    value.clear();
    _debugProvider();
    notifyListeners();
  }

  void _debugProvider() {
    log('List item: ${value.length}');
  }
}
