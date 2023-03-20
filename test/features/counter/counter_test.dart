import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_value_notifier/src/dependency_injector/dependency_injector.dart';
import 'package:provider_value_notifier/src/features/counter/counter_view.dart';

void main() {
  testWidgets('Counter initial', (WidgetTester tester) async {
    await tester.pumpWidget(
      const DependencyInjector(
        child: MaterialApp(home: CounterView()),
      ),
    );

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });

  testWidgets('Counter increment and decrement', (WidgetTester tester) async {
    await tester.pumpWidget(
      const DependencyInjector(
        child: MaterialApp(home: CounterView()),
      ),
    );

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add_outlined));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);

    await tester.tap(find.byIcon(Icons.remove_outlined));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
