import 'package:flutter/material.dart';
import '../../app/theme/colors.dart';

class CardNoActivity extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const CardNoActivity({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon Wrapper
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.ecoGreen10,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: AppColors.ecoGreen800, size: 32),
          ),
          const SizedBox(height: 24),
          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.ecoGreen900,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 12),
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.ecoGreen500,
              fontSize: 14,
              height: 1.4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
