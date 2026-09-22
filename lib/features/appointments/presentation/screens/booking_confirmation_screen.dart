import 'package:flutter/material.dart';

import '../../domain/models/appointment.dart';
import 'my_appointments_screen.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final Appointment appointment;

  const BookingConfirmationScreen({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmed'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 32),

            CircleAvatar(
              radius: 42,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(
                Icons.check,
                size: 48,
                color: colorScheme.primary,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Appointment Confirmed',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              'Your appointment has been booked successfully.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),


            Card(
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
                    _DetailRow(
                      icon: Icons.person_outline,
                      title: 'Doctor',
                      value: appointment.doctorName,
                    ),
                    const Divider(height: 24),
                    _DetailRow(
                      icon: Icons.medical_services_outlined,
                      title: 'Speciality',
                      value: appointment.speciality,
                    ),
                    const Divider(height: 24),
                    _DetailRow(
                      icon: Icons.schedule,
                      title: 'Time',
                      value: appointment.slot,
                    ),
                    const Divider(height: 24),
                    _DetailRow(
                      icon: Icons.currency_rupee,
                      title: 'Fee',
                      value:
                      '₹${appointment.consultationFee.toStringAsFixed(0)}',
                      valueColor: colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),


            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const MyAppointmentsScreen(),
                    ),
                  );
                },
                child: const Text(
                  'View My Appointments',
                ),
              ),
            ),

            const SizedBox(height: 12),


            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).popUntil(
                        (route) => route.isFirst,
                  );
                },
                child: const Text(
                  'Back to Doctors',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;

  const _DetailRow({
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          size: 22,
          color: colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: valueColor,
            ),
          ),
        ),
      ],
    );
  }
}