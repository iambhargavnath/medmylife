import 'package:flutter/material.dart';

import '../../domain/entities/doctor.dart';

class DoctorBookingButton extends StatelessWidget {
  final Doctor doctor;
  final bool isBooking;
  final bool hasSelectedSlot;
  final VoidCallback onBook;

  const DoctorBookingButton({
    super.key,
    required this.doctor,
    required this.isBooking,
    required this.hasSelectedSlot,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    final canBook =
        doctor.available &&
            hasSelectedSlot &&
            !isBooking;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: FilledButton(
        onPressed: canBook ? onBook : null,
        child: isBooking
            ? const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
          ),
        )
            : const Text(
          'Book Appointment',
        ),
      ),
    );
  }
}