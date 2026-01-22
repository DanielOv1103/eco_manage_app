import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../layout/card_no_activity.dart';

class Finance extends StatelessWidget {
  const Finance({super.key});

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
                'Presupuestos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            CardNoActivity(
              icon: LucideIcons.plus,
              title: 'Crea tu primer presupuesto',
              description: 'Comienza creando tu primer presupuesto',
              onTapRoute: '/finance/budgets',
            ),
            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Planes de ahorros',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            CardNoActivity(
              icon: LucideIcons.plus,
              title: 'Crea tu primer plan de ahorro',
              description:
                  'Comienza creando tu primer plan de ahorro :b',
            ),

            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Historial de movimientos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            CardNoActivity(
              icon: LucideIcons.calendar,
              title: 'No hay actividades recientes',
              description:
                  'Comienza creando tu primer presupuesto o tu primer plan de ahorro :b',
            ),
          ],
        ),
      ),
    );
  }
}
