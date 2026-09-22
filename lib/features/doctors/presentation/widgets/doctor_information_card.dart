import 'package:flutter/material.dart';

import '../../domain/entities/doctor.dart';
import 'doctor_info_row.dart';

class DoctorInformationCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorInformationCard({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DoctorInfoRow(
              icon: Icons.work_outline,
              title: 'Experience',
              value: '${doctor.experience} years',
            ),

            const Divider(height: 24),

            DoctorInfoRow(
              icon: Icons.currency_rupee,
              title: 'Consultation Fee',
              value:
              '₹${doctor.consultationFee.toStringAsFixed(0)}',
              valueColor: colorScheme.primary,
            ),

            const Divider(height: 24),

            DoctorInfoRow(
              icon: Icons.circle,
              title: 'Availability',
              value: doctor.available
                  ? 'Available'
                  : 'Unavailable',
              valueColor: doctor.available
                  ? Colors.green
                  : colorScheme.error,
            ),
          ],
        ),
      ),
    );
  }
}