import 'package:flutter/material.dart';
import '../../app/theme/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5E7EB), // Color gris claro para el borde
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo and Title
          Row(
            children: [
              Image.asset(
                'assets/image/eco_manage.png',
                height: 32, // Ajusta según el tamaño de tu logo
              ),
              const SizedBox(width: 8),
              const Text(
                'EcoManage',
                style: TextStyle(
                  color: AppColors.ecoGreen600,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Notification Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.ecoGreen600,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                // Acción de notificación
              },
            ),
          ),
        ],
      ),
    );
  }
}
