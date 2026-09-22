import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../appointments/presentation/providers/appointment_providers.dart';
import '../../../doctors/presentation/providers/doctor_providers.dart';
import '../providers/auth_providers.dart';

final authControllerProvider =
NotifierProvider<AuthController, AsyncValue<void>>(
  AuthController.new,
);

class AuthController extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() {
    return const AsyncData(null);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(
        authRepositoryProvider,
      );

      await repository.login(
        email: email,
        password: password,
      );

      final localDataSource = ref.read(
        authLocalDataSourceProvider,
      );

      await localDataSource.saveLoginState();

      ref.invalidate(authStatusProvider);

      state = const AsyncData(null);

    } catch (error, stackTrace) {
      state = AsyncError(
        error,
        stackTrace,
      );
    }
  }

  Future<void> logout() async {
    final localDataSource = ref.read(
      authLocalDataSourceProvider,
    );

    final appointmentDatabase = ref.read(
      appointmentDatabaseProvider,
    );

    final doctorDatabase = ref.read(
      doctorDatabaseProvider,
    );

    await appointmentDatabase.clearLocalAppointments();

    await doctorDatabase.clearDoctors();

    await localDataSource.clearLoginState();

    ref.invalidate(
      queuedAppointmentsProvider,
    );

    ref.invalidate(
      myAppointmentsProvider,
    );

    ref.invalidate(
      doctorListControllerProvider,
    );

    ref.invalidate(
      doctorDetailsControllerProvider,
    );

    ref.invalidate(authStatusProvider);
  }
}