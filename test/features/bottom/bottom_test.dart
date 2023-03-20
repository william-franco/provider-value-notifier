import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_value_notifier/src/dependency_injector/dependency_injector.dart';

void main() {
  testWidgets('NavigationBar initial', (WidgetTester tester) async {
    await tester.pumpWidget(
      DependencyInjector(
        child: MaterialApp(
          home: Scaffold(
            bottomNavigationBar: NavigationBar(
              selectedIndex: 0,
              onDestinationSelected: (int index) {},
              destinations: const <NavigationDestination>[
                NavigationDestination(
                  icon: Icon(Icons.add_home_outlined),
                  label: 'Counter',
                ),
                NavigationDestination(
                  icon: Icon(Icons.list_alt_outlined),
                  label: 'List',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.text('Counter'), findsOneWidget);
    expect(find.text('List'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('NavigationBar selected', (WidgetTester tester) async {
    await tester.pumpWidget(
      DependencyInjector(
        child: MaterialApp(
          home: Scaffold(
            bottomNavigationBar: NavigationBar(
              selectedIndex: 0,
              onDestinationSelected: (int index) {},
              destinations: const <NavigationDestination>[
                NavigationDestination(
                  icon: Icon(Icons.add_home_outlined),
                  label: 'Counter',
                ),
                NavigationDestination(
                  icon: Icon(Icons.list_alt_outlined),
                  label: 'List',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.list_alt_outlined));
    await tester.pumpAndSettle();

    expect(find.text('List'), findsOneWidget);
  });
}
