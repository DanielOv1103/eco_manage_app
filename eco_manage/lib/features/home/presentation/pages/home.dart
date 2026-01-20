import 'package:eco_manage/features/home/presentation/widgets/card_presupuesto_circle.dart';
import 'package:flutter/material.dart';

import '../widgets/card_home_consejos.dart';
import '../widgets/card_plan_ahorro.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // CardHomeConsejos(
              //   badgeText: 'Consejos',
              //   title: 'Consejos',
              //   description: 'Consejos',
              //   buttonText: 'Consejos',
              //   onButtonPressed: () {},
              //   imagePath: 'assets/images/consejos.png',
              // ),
              // const SizedBox(height: 16),
              // Ejemplo de cards de presupuesto
              Row(
                children: [
                  Expanded(
                    child: CardPresupuestoCircle(
                      title: 'Presupuesto Mensual',
                      showTwoCircles: true,
                      dataType: 'Ingresos',
                      dataType2: 'Egresos',
                      amount: 1500,
                      amount2: 750,
                      currency: 'Soles',
                      dateRange: '12/12/2025 - 12/01/2026',
                      progress: 0.75, // 75% de progreso
                      progress2: 0.5, // 50% de progreso
                      isDarkScheme: false, // Esquema blanco
                      headerIcon: Icons.account_balance_wallet,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Ejemplo de cards de plan de ahorro
              Expanded(
                child: Column(
                  children: [
                    CardPlanAhorro(
                      title: 'Plan de Ahorro',
                      description: 'Ahorro para la moto de mis sueños',
                      targetAmount: 1500,
                      currencySymbol: 's/',
                      dateRange: '12/12/2025 - 12/01/2026',
                      progress: 0.20, // 20% de progreso
                      isDarkScheme: true, // Esquema verde
                      headerIcon: Icons.savings,
                    ),
                    const SizedBox(height: 16),
                    CardPlanAhorro(
                      title: 'Plan de Ahorro',
                      description: 'Ahorro para la moto de mis sueños',
                      targetAmount: 1500,
                      currencySymbol: 's/',
                      dateRange: '12/12/2025 - 12/01/2026',
                      progress: 0.20, // 20% de progreso
                      isDarkScheme: false, // Esquema blanco
                      headerIcon: Icons.savings,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              //  Expanded(
              //   child: ListView(
              //     children: [
              //       CardHomeConsejos(
              //         badgeText: 'Recomendado',
              //         title: 'Tips de ahorro diario',
              //         description:
              //             'Pequeños cambios que hacen gran diferencia.',
              //         buttonText: 'Ver tips',
              //         onButtonPressed: () {},
              //         imagePath: 'assets/images/tips.png',
              //       ),
              //       const SizedBox(height: 16),
              //       CardHomeConsejos(
              //         badgeText: 'Trending',
              //         title: 'Inversiones inteligentes',
              //         description:
              //             'Aprende a invertir tu dinero de forma segura.',
              //         buttonText: 'Explorar',
              //         onButtonPressed: () {},
              //         imagePath: 'assets/images/investment.png',
              //       ),
              //       const SizedBox(height: 16),
              //       CardHomeConsejos(
              //         badgeText: 'Trending',
              //         title: 'Inversiones inteligentes',
              //         description:
              //             'Aprende a invertir tu dinero de forma segura.',
              //         buttonText: 'Explorar',
              //         onButtonPressed: () {},
              //         imagePath: 'assets/images/investment.png',
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
