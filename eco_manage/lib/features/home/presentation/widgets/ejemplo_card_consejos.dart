// Ejemplo de uso del componente CardHomeConsejos
// Puedes copiar este código en tu página home.dart

import 'package:flutter/material.dart';
import '../widgets/card_home_consejos.dart';

class EjemploUsoCardConsejos extends StatelessWidget {
  const EjemploUsoCardConsejos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Ejemplo 1: Card con todos los parámetros
              CardHomeConsejos(
                badgeText: 'Populares',
                title: 'El mejor plan para ahorrar',
                description:
                    'Genera un plan de ahorro estable y de fácil recurrencia.',
                buttonText: 'Generar',
                onButtonPressed: () {
                  // Acción cuando se presiona el botón
                  print('Botón presionado!');
                  // Aquí puedes navegar a otra pantalla, mostrar un diálogo, etc.
                },
                // Ruta de la imagen - ajusta según tu estructura de assets
                imagePath: 'assets/images/person_chart.png',
              ),

              const SizedBox(height: 20),

              // Ejemplo 2: Card con color de fondo personalizado
              CardHomeConsejos(
                badgeText: 'Nuevo',
                title: 'Controla tus gastos mensuales',
                description:
                    'Visualiza y analiza tus gastos de forma inteligente.',
                buttonText: 'Comenzar',
                onButtonPressed: () {
                  // Acción personalizada
                },
                imagePath: 'assets/images/analytics.png',
                backgroundColor: const Color(0xFF06B083), // ecoGreen300
              ),

              const SizedBox(height: 20),

              // Ejemplo 3: Card en un ListView para scroll
              Expanded(
                child: ListView(
                  children: [
                    CardHomeConsejos(
                      badgeText: 'Recomendado',
                      title: 'Tips de ahorro diario',
                      description:
                          'Pequeños cambios que hacen gran diferencia.',
                      buttonText: 'Ver tips',
                      onButtonPressed: () {},
                      imagePath: 'assets/images/tips.png',
                    ),
                    const SizedBox(height: 16),
                    CardHomeConsejos(
                      badgeText: 'Trending',
                      title: 'Inversiones inteligentes',
                      description:
                          'Aprende a invertir tu dinero de forma segura.',
                      buttonText: 'Explorar',
                      onButtonPressed: () {},
                      imagePath: 'assets/images/investment.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 
 * NOTAS DE USO:
 * 
 * 1. Asegúrate de tener las imágenes en tu carpeta de assets
 * 2. Actualiza el pubspec.yaml para incluir las imágenes:
 *    
 *    flutter:
 *      assets:
 *        - assets/images/
 * 
 * 3. La card es completamente responsiva:
 *    - Móviles (<600px): Layout compacto con imagen más pequeña
 *    - Tablets (600-900px): Layout intermedio
 *    - Desktop (>900px): Layout completo con imagen grande
 * 
 * 4. Props disponibles:
 *    - badgeText: Texto del badge superior
 *    - title: Título principal
 *    - description: Descripción/subtítulo
 *    - buttonText: Texto del botón
 *    - onButtonPressed: Callback del botón
 *    - imagePath: Ruta de la imagen (asset o network)
 *    - backgroundColor: Color de fondo (opcional, por defecto ecoGreen400)
 */
