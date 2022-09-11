import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_value_notifier/src/features/items/item_notifier.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<ItemsNotifier>().value;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Items'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              context.read<ItemsNotifier>().removeAllItems();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: value.isEmpty
            ? const Center(child: Text('The list is empty.'))
            : ListView.separated(
                itemCount: value.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 8.0),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('$index'),
                    ),
                    title: Text('Item $index'),
                  );
                },
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('addItemToList'),
            child: const Icon(Icons.add_outlined),
            onPressed: () {
              context.read<ItemsNotifier>().addItemToList();
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('removeItemFromList'),
            child: const Icon(Icons.remove_outlined),
            onPressed: () {
              context.read<ItemsNotifier>().removeItemFromList();
            },
          ),
        ],
      ),
    );
  }
}
