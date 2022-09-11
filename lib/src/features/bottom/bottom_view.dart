import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_value_notifier/src/features/bottom/bottom_notifier.dart';
import 'package:provider_value_notifier/src/features/counter/counter_view.dart';
import 'package:provider_value_notifier/src/features/items/item_view.dart';
import 'package:provider_value_notifier/src/features/settings/setting_view.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  final tabs = [
    const CounterView(),
    const ItemsView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    final value = context.watch<BottomNotifier>().value;
    return Scaffold(
      body: tabs[value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: value,
        onTap: (int index) {
          context.read<BottomNotifier>().updateTab(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_home_outlined),
            label: 'Counter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
