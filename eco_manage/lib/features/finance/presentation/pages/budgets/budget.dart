import 'package:eco_manage/features/layout/card_no_activity.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:eco_manage/app/theme/colors.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tus Presupuestos',
                  style: TextStyle(
                    color: AppColors.ecoGreen900,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CardNoActivity(
                icon: LucideIcons.tag,
                title: 'Agrega Items',
                description: 'Agrega items a tu presupuesto',
                onTapRoute: '/finance/budgets/create',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
