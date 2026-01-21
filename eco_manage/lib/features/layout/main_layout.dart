import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'header.dart';
import 'app_bar.dart';
import '../../app/theme/colors.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/finance')) return 1;
    // Agrega más condiciones para otras rutas aquí
    return 0; // Por defecto Home
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/finance');
        break;
      // Casos para otros índices...
    }
  }

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                const Header(),
                Expanded(
                  child: child
                      .animate(key: ValueKey(location))
                      .fade(duration: 400.ms, curve: Curves.easeInOut)
                      .slideY(
                        begin: 0.05,
                        end: 0,
                        duration: 400.ms,
                        curve: Curves.easeOutQuad,
                      ),
                ),
                const SizedBox(height: 80),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: EcoBottomBar(
                currentIndex: _calculateSelectedIndex(context),
                onTap: (index) => _onItemTapped(index, context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
