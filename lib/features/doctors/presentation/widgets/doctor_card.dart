import 'package:flutter/material.dart';

import '../../domain/entities/doctor.dart';
import '../screens/doctor_details_screen.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.medical_services,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        doctor.speciality,
                        style: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                _AvailabilityBadge(
                  available: doctor.available,
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _InfoItem(
                    icon: Icons.work_outline,
                    label: 'Experience',
                    value: '${doctor.experience} years',
                  ),
                ),
                Expanded(
                  child: _InfoItem(
                    icon: Icons.currency_rupee,
                    label: 'Consultation',
                    value:
                    '₹${doctor.consultationFee.toStringAsFixed(0)}',
                    highlight: true,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DoctorDetailsScreen(
                        doctor: doctor,
                      ),
                    ),
                  );
                },
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool highlight;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: highlight ? 16 : 14,
                color: highlight
                    ? colorScheme.primary
                    : colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {
  final bool available;

  const _AvailabilityBadge({
    required this.available,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          size: 8,
          color: available
              ? Colors.green
              : colorScheme.error,
        ),
        const SizedBox(width: 5),
        Text(
          available ? 'Available' : 'Unavailable',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: available
                ? Colors.green
                : colorScheme.error,
          ),
        ),
      ],
    );
  }
}