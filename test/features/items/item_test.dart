import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_value_notifier/src/dependency_injector/dependency_injector.dart';
import 'package:provider_value_notifier/src/features/items/item_view.dart';

void main() {
  testWidgets('Item initial', (WidgetTester tester) async {
    await tester.pumpWidget(
      const DependencyInjector(
        child: MaterialApp(home: ItemsView()),
      ),
    );

    expect(find.text('The list is empty.'), findsOneWidget);
    expect(find.text('Item 0'), findsNothing);
  });

  testWidgets('Item add, remove and remove all', (WidgetTester tester) async {
    await tester.pumpWidget(
      const DependencyInjector(
        child: MaterialApp(home: ItemsView()),
      ),
    );

    expect(find.text('The list is empty.'), findsOneWidget);
    expect(find.text('Item 0'), findsNothing);

    await tester.tap(find.byIcon(Icons.add_outlined));
    await tester.pump();

    expect(find.text('Item 0'), findsOneWidget);
    expect(find.text('The list is empty.'), findsNothing);

    await tester.tap(find.byIcon(Icons.remove_outlined));
    await tester.pump();

    expect(find.text('The list is empty.'), findsOneWidget);
    expect(find.text('Item 0'), findsNothing);

    await tester.tap(find.byIcon(Icons.delete_forever_outlined));
    await tester.pump();

    expect(find.text('The list is empty.'), findsOneWidget);
    expect(find.text('Item 0'), findsNothing);
  });
}
