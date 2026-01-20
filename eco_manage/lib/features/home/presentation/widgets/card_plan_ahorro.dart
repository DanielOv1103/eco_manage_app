import 'package:flutter/material.dart';
import '../../../../app/theme/colors.dart';

/// Card de plan de ahorro con barra de progreso animada
/// Soporta dos esquemas de colores: claro (blanco) y oscuro (verde)
class CardPlanAhorro extends StatefulWidget {
  /// Título de la card (ej: "Plan de Ahorro")
  final String title;

  /// Descripción del objetivo de ahorro
  final String description;

  /// Monto objetivo a ahorrar
  final double targetAmount;

  /// Moneda (ej: "s/", "USD")
  final String currencySymbol;

  /// Rango de fechas (ej: "12/12/2025 - 12/01/2026")
  final String dateRange;

  /// Porcentaje de progreso (0.0 a 1.0)
  final double progress;

  /// Esquema de colores: true para verde, false para blanco
  final bool isDarkScheme;

  /// Ícono opcional para mostrar en el header
  final IconData? headerIcon;

  const CardPlanAhorro({
    super.key,
    required this.title,
    required this.description,
    required this.targetAmount,
    required this.currencySymbol,
    required this.dateRange,
    required this.progress,
    this.isDarkScheme = false,
    this.headerIcon,
  });

  @override
  State<CardPlanAhorro> createState() => _CardPlanAhorroState();
}

class _CardPlanAhorroState extends State<CardPlanAhorro>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Configurar animación
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: widget.progress)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
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
  void didUpdateWidget(CardPlanAhorro oldWidget) {
    super.didUpdateWidget(oldWidget);
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
        ? AppColors.ecoGreen200
        : AppColors.ecoGreen600;
    final progressBarColor = widget.isDarkScheme
        ? AppColors.primary
        : AppColors.ecoGreen600;
    final progressBackgroundColor = widget.isDarkScheme
        ? AppColors.ecoGreen700.withOpacity(0.3)
        : AppColors.ecoGreen50;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 400, minHeight: 200),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.isDarkScheme
                  ? AppColors.ecoGreen800.withOpacity(0.3)
                  : Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header con título e ícono
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (widget.headerIcon != null)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: textColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        widget.headerIcon,
                        color: textColor,
                        size: 20,
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 16),

              // Línea divisoria punteada
              _buildDashedLine(accentColor),

              const SizedBox(height: 16),

              // Descripción con ícono
              Row(
                children: [
                  Icon(Icons.savings_outlined, color: accentColor, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Monto objetivo
              Text(
                '${widget.currencySymbol} ${widget.targetAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  color: accentColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                ),
              ),

              const SizedBox(height: 16),

              // Barra de progreso con porcentaje
              AnimatedBuilder(
                animation: _progressAnimation,
                builder: (context, child) {
                  final progressPercent = (_progressAnimation.value * 100)
                      .toInt();
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 8,
                              decoration: BoxDecoration(
                                color: progressBackgroundColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: _progressAnimation.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: progressBarColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            '$progressPercent%',
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 16),

              // Línea divisoria punteada
              _buildDashedLine(accentColor),

              const SizedBox(height: 12),

              // Rango de fechas
              Center(
                child: Text(
                  widget.dateRange,
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
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
