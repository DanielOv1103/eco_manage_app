import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/theme/colors.dart';

class CardNoActivity extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? onTapRoute;
  final bool enabled;

  const CardNoActivity({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onTapRoute,
    this.enabled = true,
  });

  @override
  State<CardNoActivity> createState() => _CardNoActivityState();
}

class _CardNoActivityState extends State<CardNoActivity> {
  bool _isPressed = false;

  void _onPressedDown() {
    if (!widget.enabled) return;
    setState(() => _isPressed = true);
  }

  void _onPressedUp() {
    if (!widget.enabled) return;
    setState(() => _isPressed = false);
    if (widget.onTapRoute != null) {
      context.push(widget.onTapRoute!);
    }
  }

  void _onPressedCancel() {
    if (!widget.enabled) return;
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final bool showActive = _isPressed && widget.enabled;

    return GestureDetector(
      onTapDown: (_) => _onPressedDown(),
      onTapUp: (_) => _onPressedUp(),
      onTapCancel: () => _onPressedCancel(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        decoration: BoxDecoration(
          color: showActive ? AppColors.ecoGreen600 : Colors.white,
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
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: showActive
                    ? AppColors.ecoGreen500.withOpacity(0.5)
                    : AppColors.ecoGreen10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                widget.icon,
                color: showActive ? Colors.white : AppColors.ecoGreen800,
                size: 32,
              ),
            ),
            const SizedBox(height: 24),
            // Title
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 150),
              style: TextStyle(
                color: showActive ? Colors.white : AppColors.ecoGreen900,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
              child: Text(widget.title, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 12),
            // Description
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 150),
              style: TextStyle(
                color: showActive
                    ? AppColors.ecoGreen10
                    : AppColors.ecoGreen500,
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
              child: Text(widget.description, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
