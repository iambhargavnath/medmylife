import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../appointments/domain/models/appointment_slot.dart';
import '../../../appointments/presentation/providers/appointment_providers.dart';
import '../../../appointments/presentation/screens/appointment_queue_screen.dart';
import '../../../appointments/presentation/screens/booking_confirmation_screen.dart';

import '../../domain/entities/doctor.dart';

import '../controllers/doctor_details_state.dart';
import '../providers/doctor_providers.dart';

import '../widgets/doctor_booking_button.dart';
import '../widgets/doctor_details_header.dart';
import '../widgets/doctor_information_card.dart';
import '../widgets/doctor_slots_section.dart';

class DoctorDetailsScreen extends ConsumerStatefulWidget {
  final Doctor doctor;

  const DoctorDetailsScreen({
    super.key,
    required this.doctor,
  });

  @override
  ConsumerState<DoctorDetailsScreen> createState() =>
      _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState
    extends ConsumerState<DoctorDetailsScreen> {
  String? _selectedSlot;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(
        doctorDetailsControllerProvider.notifier,
      )
          .loadDoctor(widget.doctor.id);
    });

  }

  @override
  Widget build(BuildContext context) {
    final doctorState = ref.watch(
      doctorDetailsControllerProvider,
    );

    final bookingState = ref.watch(
      appointmentControllerProvider,
    );

    final slotsState = ref.watch(
      appointmentSlotsProvider(widget.doctor.id),
    );

    ref.listen(
      appointmentControllerProvider,
          (previous, next) {
        if (!mounted) {
          return;
        }

// Booking failed.
        if (next.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Booking failed. Your appointment has been added to the queue.',
              ),
            ),
          );

          Future.delayed(
            const Duration(milliseconds: 1000),
                () {
              if (!mounted) return;

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AppointmentQueueScreen(),
                ),
              );
            },
          );

          return;
        }

// Booking succeeded.
        if (previous?.isLoading == true &&
            next.hasValue &&
            next.value != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  BookingConfirmationScreen(
                    appointment: next.value!,
                  ),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Details'),
      ),
      body: _buildBody(
        context: context,
        doctorState: doctorState,
        slotsState: slotsState,
        isBooking: bookingState.isLoading,
      ),
    );
  }

  Widget _buildBody({
    required BuildContext context,
    required DoctorDetailsState doctorState,
    required AsyncValue<List<AppointmentSlot>> slotsState,
    required bool isBooking,
  }) {

    if (doctorState.isLoading &&
        doctorState.doctor == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }


    if (doctorState.doctor == null) {
      return _buildError(
        context,
        doctorState,
      );
    }

    final doctor = doctorState.doctor!;

    return RefreshIndicator(
      onRefresh: () {
        return ref
            .read(
          doctorDetailsControllerProvider.notifier,
        )
            .loadDoctor(doctor.id);
      },
      child: SingleChildScrollView(
        physics:
        const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [

            if (doctorState.isRefreshing)
              const LinearProgressIndicator(),

            if (doctorState.isRefreshing)
              const SizedBox(height: 12),


            if (doctorState.errorMessage != null)
              _buildRefreshMessage(
                context,
                doctorState.errorMessage!,
              ),

            DoctorDetailsHeader(
              doctor: doctor,
            ),

            const SizedBox(height: 24),

            DoctorInformationCard(
              doctor: doctor,
            ),

            const SizedBox(height: 28),

            DoctorSlotsSection(
              slotsState: slotsState,
              isBooking: isBooking,
              selectedSlot: _selectedSlot,
              onSlotSelected: (slot) {
                setState(() {
                  _selectedSlot = slot;
                });
              },
              onRetry: () {
                ref.invalidate(
                  appointmentSlotsProvider(
                    doctor.id,
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            DoctorBookingButton(
              doctor: doctor,
              isBooking: isBooking,
              hasSelectedSlot:
              _selectedSlot != null,
              onBook: _bookAppointment,
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildError(
      BuildContext context,
      DoctorDetailsState doctorState,
      ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              doctorState.errorMessage ??
                  'Unable to load doctor details.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            OutlinedButton.icon(
              onPressed: () {
                ref
                    .read(
                  doctorDetailsControllerProvider
                      .notifier,
                )
                    .retry(widget.doctor.id);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRefreshMessage(
      BuildContext context,
      String message,
      ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyMedium,
      ),
    );
  }

  Future<void> _bookAppointment() async {
    final doctor = ref
        .read(
      doctorDetailsControllerProvider,
    )
        .doctor;

    final selectedSlot = _selectedSlot;

    if (doctor == null ||
        selectedSlot == null) {
      return;
    }

    await ref
        .read(
      appointmentControllerProvider.notifier,
    )
        .bookAppointment(
      doctorId: doctor.id,
      doctorName: doctor.name,
      speciality: doctor.speciality,
      slot: selectedSlot,
      consultationFee:
      doctor.consultationFee,
    );
  }

}