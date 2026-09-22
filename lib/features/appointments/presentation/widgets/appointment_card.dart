import 'package:flutter/material.dart';

import '../../domain/models/appointment.dart';
import 'appointment_detail_row.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({
    super.key,
    required this.appointment,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DoctorHeader(
              doctorName: appointment.doctorName,
              speciality: appointment.speciality,
            ),

            const SizedBox(height: 16),

            const Divider(),

            const SizedBox(height: 12),

            AppointmentDetailRow(
              icon: Icons.schedule,
              label: 'Time',
              value: appointment.slot,
            ),

            const SizedBox(height: 12),

            AppointmentDetailRow(
              icon: Icons.currency_rupee,
              label: 'Consultation Fee',
              value:
              '₹${appointment.consultationFee.toStringAsFixed(0)}',
              valueColor: colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorHeader extends StatelessWidget {
  final String doctorName;
  final String speciality;

  const _DoctorHeader({
    required this.doctorName,
    required this.speciality,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: colorScheme.primaryContainer,
          child: Icon(
            Icons.person_outline,
            color: colorScheme.primary,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorName,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                speciality,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}