import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../app/theme/colors.dart';

class EcoSheet extends StatelessWidget {
  final Widget Function(BuildContext context, VoidCallback open) trigger;
  final Widget child;
  final String? title;
  final String? description;

  const EcoSheet({
    super.key,
    required this.trigger,
    required this.child,
    this.title,
    this.description,
  });

  void _openSheet(BuildContext context) {
    showShadSheet(
      context: context,
      side: ShadSheetSide.bottom,
      useRootNavigator:
          true, // Asegura que se sobreponga a todo (Header y Footer)
      builder: (context) => ShadSheet(
        radius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        title: title != null ? Text(title!) : null,
        description: description != null ? Text(description!) : null,
        closeIcon: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: AppColors.ecoGreen600,
              shape: BoxShape.circle,
            ),
            child: const Icon(LucideIcons.x, color: Colors.white, size: 24),
          ),
        ),
        child: SizedBox(width: double.infinity, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return trigger(context, () => _openSheet(context));
  }
}
