import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../appointments/domain/models/appointment_slot.dart';
import '../../../appointments/presentation/widgets/appointment_slot_chip.dart';

class DoctorSlotsSection extends StatelessWidget {
  final AsyncValue<List<AppointmentSlot>> slotsState;
  final bool isBooking;
  final String? selectedSlot;
  final ValueChanged<String> onSlotSelected;
  final VoidCallback onRetry;

  const DoctorSlotsSection({
    super.key,
    required this.slotsState,
    required this.isBooking,
    required this.selectedSlot,
    required this.onSlotSelected,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Slots',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        slotsState.when(
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(),
            ),
          ),

          error: (error, stackTrace) {
            return _buildError(context);
          },

          data: (slots) {
            if (slots.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                ),
                child: Center(
                  child: Text(
                    'No appointment slots available.',
                  ),
                ),
              );
            }

            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: slots.map((slot) {
                final isSelected =
                    selectedSlot == slot.time;

                return AppointmentSlotChip(
                  label: slot.time,
                  selected: isSelected,
                  enabled:
                  slot.available && !isBooking,
                  onTap: () {
                    onSlotSelected(slot.time);
                  },
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildError(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),

        Text(
          'Failed to load appointment slots.',
          style: Theme.of(context)
              .textTheme
              .bodyLarge,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 8),

        OutlinedButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: const Text('Retry'),
        ),
      ],
    );
  }
}