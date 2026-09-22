import 'package:flutter/material.dart';

class AppointmentSlotChip extends StatelessWidget {
  final String label;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  const AppointmentSlotChip({
    super.key,
    required this.label,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor = selected
        ? colorScheme.primary
        : colorScheme.surface;

    final borderColor = selected
        ? colorScheme.primary
        : colorScheme.outline;

    final textColor = selected
        ? colorScheme.onPrimary
        : colorScheme.onSurface;

    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: enabled
              ? backgroundColor
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: enabled
                ? borderColor
                : colorScheme.outlineVariant,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: enabled
                ? textColor
                : colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}