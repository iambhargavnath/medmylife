import 'package:flutter/material.dart';

import '../../domain/models/queue_status.dart';
import 'appointment_detail_row.dart';
import 'queue_status_badge.dart';

class QueuedAppointmentCard extends StatelessWidget {
  final dynamic item;
  final bool isRetrying;
  final VoidCallback onRetry;

  const QueuedAppointmentCard({
    super.key,
    required this.item,
    required this.isRetrying,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final appointment = item.appointment;
    final QueueStatus status = item.status;

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
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                  colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person_outline,
                    color: colorScheme.primary,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.doctorName,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        appointment.speciality,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                          color: colorScheme
                              .onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                QueueStatusBadge(
                  status: status,
                ),
              ],
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

            if (item.retryCount > 0) ...[
              const SizedBox(height: 12),

              AppointmentDetailRow(
                icon: Icons.refresh,
                label: 'Retry Attempts',
                value: '${item.retryCount}',
              ),
            ],

            if (status == QueueStatus.failed) ...[
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed:
                  isRetrying ? null : onRetry,
                  icon: isRetrying
                      ? const SizedBox(
                    width: 16,
                    height: 16,
                    child:
                    CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                      : const Icon(
                    Icons.refresh,
                  ),
                  label: Text(
                    isRetrying
                        ? 'Retrying...'
                        : 'Retry',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}