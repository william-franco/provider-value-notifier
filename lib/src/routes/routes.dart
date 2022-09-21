import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_value_notifier/src/features/bottom/bottom_view.dart';

class Routes {
  Routes._();

  static const String home = '/';

  static final routes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        pageBuilder: (context, state) => const CupertinoPage(
          child: BottomView(),
        ),
      ),
    ],
  );
}
