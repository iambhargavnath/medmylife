import 'package:flutter/material.dart';

class AppointmentErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const AppointmentErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
            ),

            const SizedBox(height: 16),

            Text(
              message,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}