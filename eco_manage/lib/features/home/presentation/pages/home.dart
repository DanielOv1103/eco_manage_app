import 'package:flutter/material.dart';

import '../../../../app/theme/app_theme.dart';
import '../../../../app/theme/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.dark(),
      home: Scaffold(body: Center(child: Text('HOLA PAMPUS', style: const TextStyle(fontSize: 24, color: AppColors.ecoGreen500)))),
    );
  }
}