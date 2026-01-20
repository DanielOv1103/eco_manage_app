import 'package:flutter/material.dart';
import 'header.dart';
import 'app_bar.dart';
import '../../app/theme/colors.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false, // Permitir que el Layout llegue hasta el fondo
        child: Stack(
          children: [
            // Contenido Principal
            Column(
              children: [
                const Header(),
                Expanded(child: child),
                // Espacio para evitar que la barra tape el contenido
                const SizedBox(height: 80),
              ],
            ),

            // Barra de Navegación Inferior (Sticky)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: EcoBottomBar(
                currentIndex:
                    0, // Esto debería manejarse con un estado (Riverpod/Provider)
                onTap: (index) {
                  // Lógica de navegación
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
