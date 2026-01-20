import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../app/theme/colors.dart';

/// Card de consejos/tips para la página home
/// Componente responsivo que se adapta a diferentes tamaños de pantalla
class CardHomeConsejos extends StatelessWidget {
  /// Texto del badge superior (ej: "Populares", "Nuevo", etc.)
  final String badgeText;

  /// Título principal de la card
  final String title;

  /// Descripción o subtítulo
  final String description;

  /// Texto del botón de acción
  final String buttonText;

  /// Callback cuando se presiona el botón
  final VoidCallback onButtonPressed;

  /// Ruta de la imagen que se mostrará en el lado derecho
  /// Puede ser un asset local o una URL
  final String imagePath;

  /// Color de fondo de la card (por defecto usa el color primario del proyecto)
  final Color? backgroundColor;

  const CardHomeConsejos({
    super.key,
    required this.badgeText,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
    required this.imagePath,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el ancho de la pantalla para hacer la card responsiva
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;

    // Ajustar padding según el tamaño de pantalla
    final cardPadding = isSmallScreen
        ? const EdgeInsets.all(16.0)
        : isMediumScreen
        ? const EdgeInsets.all(20.0)
        : const EdgeInsets.all(24.0);

    // Ajustar tamaño de imagen según pantalla
    final imageSize = isSmallScreen
        ? 120.0
        : isMediumScreen
        ? 150.0
        : 180.0;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: isSmallScreen ? double.infinity : 600,
        minHeight: isSmallScreen ? 200 : 220,
      ),
      decoration: BoxDecoration(
        // Usar el color primario del proyecto (ecoGreen) o el color personalizado
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            backgroundColor ?? AppColors.ecoGreen400,
            (backgroundColor ?? AppColors.ecoGreen400).withOpacity(0.85),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Decoración de fondo con curvas
            Positioned(
              right: -50,
              top: -30,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              left: -30,
              bottom: -40,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
            ),

            // Contenido principal
            Padding(
              padding: cardPadding,
              child: isSmallScreen
                  ? _buildSmallScreenLayout(imageSize)
                  : _buildLargeScreenLayout(imageSize),
            ),
          ],
        ),
      ),
    );
  }

  /// Layout para pantallas pequeñas (móviles)
  Widget _buildSmallScreenLayout(double imageSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge
        ShadBadge(
          backgroundColor: Colors.white,
          child: Text(
            badgeText,
            style: const TextStyle(
              color: AppColors.ecoGreen700,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Contenido y imagen en fila
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Textos y botón
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(18),
                  const SizedBox(height: 8),
                  _buildDescription(13),
                  const SizedBox(height: 16),
                  _buildButton(false),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Imagen
            Expanded(flex: 2, child: _buildImage(imageSize * 0.8)),
          ],
        ),
      ],
    );
  }

  /// Layout para pantallas medianas y grandes (tablets, desktop)
  Widget _buildLargeScreenLayout(double imageSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Contenido de texto
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Badge
              ShadBadge(
                backgroundColor: Colors.white,
                child: Text(
                  badgeText,
                  style: const TextStyle(
                    color: AppColors.ecoGreen700,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Título
              _buildTitle(22),
              const SizedBox(height: 12),

              // Descripción
              _buildDescription(14),
              const SizedBox(height: 20),

              // Botón
              _buildButton(true),
            ],
          ),
        ),

        const SizedBox(width: 24),

        // Imagen del lado derecho
        Expanded(flex: 2, child: _buildImage(imageSize)),
      ],
    );
  }

  /// Widget del título
  Widget _buildTitle(double fontSize) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        height: 1.2,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Widget de la descripción
  Widget _buildDescription(double fontSize) {
    return Text(
      description,
      style: TextStyle(
        color: Colors.white.withOpacity(0.95),
        fontSize: fontSize,
        height: 1.4,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Widget del botón usando ShadButton
  Widget _buildButton(bool isLargeScreen) {
    return SizedBox(
      width: isLargeScreen ? 200 : double.infinity,
      child: ShadButton(
        backgroundColor: Colors.white,
        onPressed: onButtonPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            color: AppColors.ecoGreen700,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  /// Widget de la imagen
  Widget _buildImage(double size) {
    return Container(
      height: size,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Widget de fallback si la imagen no carga
            return Container(
              color: Colors.white.withOpacity(0.2),
              child: const Center(
                child: Icon(
                  Icons.image_not_supported,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
