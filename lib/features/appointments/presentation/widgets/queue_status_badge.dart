import 'package:flutter/material.dart';

import '../../domain/models/queue_status.dart';

class QueueStatusBadge extends StatelessWidget {
  final QueueStatus status;

  const QueueStatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final text = switch (status) {
      QueueStatus.pending => 'Pending',
      QueueStatus.syncing => 'Syncing',
      QueueStatus.synced => 'Synced',
      QueueStatus.failed => 'Failed',
    };

    final icon = switch (status) {
      QueueStatus.pending => Icons.schedule,
      QueueStatus.syncing => Icons.sync,
      QueueStatus.synced => Icons.check_circle,
      QueueStatus.failed => Icons.error_outline,
    };

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outline,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
          ),

          const SizedBox(width: 5),

          Text(text),
        ],
      ),
    );
  }
}