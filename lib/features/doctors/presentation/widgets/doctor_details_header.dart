import 'package:flutter/material.dart';

import '../../domain/entities/doctor.dart';

class DoctorDetailsHeader extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailsHeader({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 42,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(
              Icons.person,
              size: 42,
              color: colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            doctor.name,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Center(
          child: Text(
            doctor.speciality,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}