import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = appRouter;

    return ShadApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
