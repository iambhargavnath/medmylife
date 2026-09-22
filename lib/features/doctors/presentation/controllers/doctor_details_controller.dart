import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/doctor.dart';
import '../../domain/repositories/doctor_repository.dart';
import '../providers/doctor_providers.dart';
import 'doctor_details_state.dart';

class DoctorDetailsController
    extends Notifier<DoctorDetailsState> {
  DoctorRepository get _repository =>
      ref.read(doctorRepositoryProvider);

  @override
  DoctorDetailsState build() {
    return const DoctorDetailsState();
  }

  Future<void> loadDoctor(String doctorId) async {
    state = state.copyWith(
      isLoading: true,
      isRefreshing: false,
      clearError: true,
    );

    Doctor? cachedDoctor;

    // 1. Load from Drift first.
    try {
      cachedDoctor =
      await _repository.getCachedDoctorById(
        doctorId,
      );

      if (cachedDoctor != null) {
        state = state.copyWith(
          doctor: cachedDoctor,
          isLoading: false,
          isRefreshing: true,
          clearError: true,
        );
      }
    } catch (_) {

    }

    // 2. Fetch latest doctor from API.
    try {
      final freshDoctor =
      await _repository.getDoctorById(
        doctorId,
      );

      state = state.copyWith(
        doctor: freshDoctor,
        isLoading: false,
        isRefreshing: false,
        clearError: true,
      );
    } catch (_) {

      // 3. Keep cached doctor if API fails.
      if (cachedDoctor != null) {
        state = state.copyWith(
          doctor: cachedDoctor,
          isLoading: false,
          isRefreshing: false,
          errorMessage:
          'Unable to refresh doctor details. '
              'Showing cached data.',
        );

        return;
      }

      // 4. No cache and API failed.
      state = state.copyWith(
        isLoading: false,
        isRefreshing: false,
        errorMessage:
        'Unable to load doctor details.',
      );
    }
  }

  Future<void> retry(String doctorId) async {
    await loadDoctor(doctorId);
  }
}