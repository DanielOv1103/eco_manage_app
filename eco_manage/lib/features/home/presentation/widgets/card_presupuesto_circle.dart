import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../app/theme/colors.dart';

/// Card de presupuesto mensual con barra de progreso circular animada
/// Soporta dos esquemas de colores: claro (blanco) y oscuro (verde)
class CardPresupuestoCircle extends StatefulWidget {
  /// Título de la card (ej: "Presupuesto Mensual")
  final String title;

  /// Tipo de dato mostrado (ej: "Total Ingresos", "Total Egresos")
  final String dataType;

  /// Valor numérico a mostrar
  final double amount;

  /// Moneda (ej: "Soles", "USD")
  final String currency;

  /// Rango de fechas (ej: "12/12/2025 - 12/01/2026")
  final String dateRange;

  /// Porcentaje de progreso (0.0 a 1.0)
  final double progress;

  /// Esquema de colores: true para verde, false para blanco
  final bool isDarkScheme;

  /// Ícono opcional para mostrar en el header
  final IconData? headerIcon;

  /// Mostrar dos círculos en lugar de uno
  final bool showTwoCircles;

  /// Tipo de dato del segundo círculo (ej: "Total Egresos")
  final String? dataType2;

  /// Valor numérico del segundo círculo
  final double? amount2;

  /// Porcentaje de progreso del segundo círculo (0.0 a 1.0)
  final double? progress2;

  const CardPresupuestoCircle({
    super.key,
    required this.title,
    required this.dataType,
    required this.amount,
    required this.currency,
    required this.dateRange,
    required this.progress,
    this.isDarkScheme = false,
    this.headerIcon,
    this.showTwoCircles = false,
    this.dataType2,
    this.amount2,
    this.progress2,
  });

  @override
  State<CardPresupuestoCircle> createState() => _CardPresupuestoCircleState();
}

class _CardPresupuestoCircleState extends State<CardPresupuestoCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late Animation<double> _progressAnimation2;

  @override
  void initState() {
    super.initState();

    // Configurar animación de progreso
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: widget.progress)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Configurar segunda animación si es necesario
    _progressAnimation2 =
        Tween<double>(begin: 0.0, end: widget.progress2 ?? 0.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Iniciar animación al entrar
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CardPresupuestoCircle oldWidget) {
    super.didUpdateWidget(oldWidget);
    bool needsAnimation = false;

    // Si el progreso cambia, animar al nuevo valor
    if (oldWidget.progress != widget.progress) {
      _progressAnimation =
          Tween<double>(
            begin: oldWidget.progress,
            end: widget.progress,
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOutCubic,
            ),
          );
      needsAnimation = true;
    }

    if (oldWidget.progress2 != widget.progress2) {
      _progressAnimation2 =
          Tween<double>(
            begin: oldWidget.progress2 ?? 0.0,
            end: widget.progress2 ?? 0.0,
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOutCubic,
            ),
          );
      needsAnimation = true;
    }

    if (needsAnimation) {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Definir colores según el esquema
    final backgroundColor = widget.isDarkScheme
        ? AppColors.ecoGreen600
        : AppColors.primary;
    final textColor = widget.isDarkScheme
        ? AppColors.textOnDark
        : AppColors.textPrimary;
    final accentColor = widget.isDarkScheme
        ? AppColors.ecoGreen300
        : AppColors.ecoGreen600;
    final progressBarColor = widget.isDarkScheme
        ? AppColors.primary.withOpacity(0.9)
        : AppColors.ecoGreen600;
    final progressBackgroundColor = widget.isDarkScheme
        ? AppColors.ecoGreen700.withOpacity(0.3)
        : AppColors.ecoGreen50;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 250, minHeight: 250),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: widget.isDarkScheme
                ? AppColors.ecoGreen800.withOpacity(0.3)
                : Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header con título e ícono
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.headerIcon != null)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      widget.headerIcon,
                      color: accentColor,
                      size: 24,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 20),

            // Línea divisoria punteada
            _buildDashedLine(accentColor),

            const SizedBox(height: 24),

            if (widget.showTwoCircles)
              Row(
                children: [
                  Expanded(
                    child: _buildCircleColumn(
                      label: widget.dataType,
                      amount: widget.amount,
                      animation: _progressAnimation,
                      accentColor: accentColor,
                      progressBarColor: progressBarColor,
                      progressBackgroundColor: progressBackgroundColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildCircleColumn(
                      label: widget.dataType2 ?? '',
                      amount: widget.amount2 ?? 0.0,
                      animation: _progressAnimation2,
                      accentColor: accentColor,
                      progressBarColor: progressBarColor,
                      progressBackgroundColor: progressBackgroundColor,
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  Center(
                    child: Text(
                      widget.dataType,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildCircle(
                    amount: widget.amount,
                    animation: _progressAnimation,
                    accentColor: accentColor,
                    progressBarColor: progressBarColor,
                    progressBackgroundColor: progressBackgroundColor,
                  ),
                ],
              ),

            const SizedBox(height: 24),

            // Línea divisoria punteada
            _buildDashedLine(accentColor),

            const SizedBox(height: 16),

            // Rango de fechas
            Center(
              child: Text(
                widget.dateRange,
                style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleColumn({
    required String label,
    required double amount,
    required Animation<double> animation,
    required Color accentColor,
    required Color progressBarColor,
    required Color progressBackgroundColor,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: accentColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),
        _buildCircle(
          amount: amount,
          animation: animation,
          accentColor: accentColor,
          progressBarColor: progressBarColor,
          progressBackgroundColor: progressBackgroundColor,
        ),
      ],
    );
  }

  Widget _buildCircle({
    required double amount,
    required Animation<double> animation,
    required Color accentColor,
    required Color progressBarColor,
    required Color progressBackgroundColor,
  }) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Círculo de progreso animado
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return CustomPaint(
                size: const Size(120, 120),
                painter: CircularProgressPainter(
                  progress: animation.value,
                  progressColor: progressBarColor,
                  backgroundColor: progressBackgroundColor,
                  strokeWidth: 12,
                ),
              );
            },
          ),

          // Contenido central (monto y moneda)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                amount.toStringAsFixed(2),
                style: TextStyle(
                  color: accentColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.currency,
                style: TextStyle(
                  color: accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Widget helper para crear línea punteada
  Widget _buildDashedLine(Color color) {
    return Row(
      children: List.generate(
        20,
        (index) => Expanded(
          child: Container(
            height: 2,
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : 2,
              right: index == 19 ? 0 : 2,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.5),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom painter para dibujar el círculo de progreso
class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Dibujar círculo de fondo
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Dibujar progreso
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Calcular ángulo de progreso (comenzar desde arriba, -90 grados)
    final sweepAngle = 2 * math.pi * progress;
    const startAngle = -math.pi / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
