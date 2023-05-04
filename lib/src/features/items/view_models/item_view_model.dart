// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

class ItemsViewModel extends ValueNotifier<List<int>> {
  ItemsViewModel() : super([]);

  int _count = 0;

  void addItemToList() {
    _count++;
    value.add(_count);
    _debug();
    notifyListeners();
  }

  void removeItemFromList() {
    _count > 0 ? _count-- : 0;
    value.isNotEmpty ? value.removeLast() : 0;
    _debug();
    notifyListeners();
  }

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
