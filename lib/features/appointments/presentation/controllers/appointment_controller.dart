import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/appointment.dart';
import '../providers/appointment_providers.dart';

class AppointmentController
    extends Notifier<AsyncValue<Appointment?>> {
  @override
  AsyncValue<Appointment?> build() {
    return const AsyncData(null);
  }

  Future<void> bookAppointment({
    required String doctorId,
    required String doctorName,
    required String speciality,
    required String slot,
    required double consultationFee,
  }) async {

// Prevent duplicate booking requests.
    if (state.isLoading) {
      return;
    }

    state = const AsyncLoading();

    try {
      final connectivity =
      await Connectivity().checkConnectivity();

      final isOffline =
      connectivity.contains(ConnectivityResult.none);

      final repository = ref.read(
        isOffline
            ? appointmentRepositoryProviderFailed
            : appointmentRepositoryProvider,
      );

      final appointment =
      await repository.bookAppointment(
        doctorId: doctorId,
        doctorName: doctorName,
        speciality: speciality,
        slot: slot,
        consultationFee: consultationFee,
      );

      state = AsyncData(appointment);

// Refresh My Appointments after successful booking.
      ref.invalidate(myAppointmentsProvider);
    } catch (error, stackTrace) {
      state = AsyncError(
        error,
        stackTrace,
      );
    }
  }

  void reset() {
    state = const AsyncData(null);
  }
}