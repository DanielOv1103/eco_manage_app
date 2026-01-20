import 'package:flutter/material.dart';
import 'header.dart';
import '../../app/theme/colors.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            Expanded(
              child: child, // El contenido de la pantalla se renderiza aquí
            ),
          ],
        ),
      ),
    );
  }
}
