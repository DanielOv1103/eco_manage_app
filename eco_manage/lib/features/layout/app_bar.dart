import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../app/theme/colors.dart';

class EcoBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const EcoBottomBar({super.key, this.currentIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, LucideIcons.house, 'Inicio'),
              _buildNavItem(1, LucideIcons.wallet, 'Ahorro'),
              _buildNavItem(2, LucideIcons.calendarRange, 'Calendario'),
              _buildNavItem(3, LucideIcons.chartColumnIncreasing, 'Gráficos'),
              _buildNavItem(4, LucideIcons.userRoundCog, 'Perfil'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isActive = currentIndex == index;
    final Color color = isActive
        ? AppColors.ecoGreen600
        : AppColors.ecoGreen900.withOpacity(0.5);

    return GestureDetector(
      onTap: () => onTap?.call(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 2),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 3,
            width: isActive ? 20 : 0,
            decoration: BoxDecoration(
              color: AppColors.ecoGreen600,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
