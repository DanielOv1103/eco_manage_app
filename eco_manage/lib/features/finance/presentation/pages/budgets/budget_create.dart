import 'package:eco_manage/features/layout/card_no_activity.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:eco_manage/app/theme/colors.dart';

import '../../../../layout/eco_sheet.dart';

class BudgetCreate extends StatelessWidget {
  const BudgetCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Inicia tu presupuesto',
                style: TextStyle(
                  color: AppColors.ecoGreen900,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            EcoSheet(
              trigger: (context, open) => ShadButton(
                width: double.infinity,
                backgroundColor: AppColors.ecoGreen600,
                hoverBackgroundColor: AppColors.ecoGreen500,
                height: 48,
                onPressed: open,
                leading: const Icon(
                  LucideIcons.handCoins,
                  color: Colors.white,
                  size: 24,
                ),
                child: const Text(
                  'Agregar Presupuesto',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              title: 'Título Opcional',
              child: Column(
                children: [
                  Text('Contenido 1'),
                  Text('Contenido 2'),
                  // CardNoActivity(
                  //   icon: LucideIcons.tag,
                  //   title: 'Agrega Items',
                  //   description: 'Agrega items a tu presupuesto',
                  //   enabled: false,
                  // ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lista de presupuesto',
                style: TextStyle(
                  color: AppColors.ecoGreen900,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            CardNoActivity(
              icon: LucideIcons.tag,
              title: 'Agrega Items',
              description: 'Agrega items a tu presupuesto',
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
