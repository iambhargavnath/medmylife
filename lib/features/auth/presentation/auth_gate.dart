import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../appointments/presentation/providers/appointment_providers.dart';
import '../../doctors/presentation/screens/doctor_list_screen.dart';
import 'providers/auth_providers.dart';
import 'screens/login_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final authStatus = ref.watch(
      authStatusProvider,
    );

    return authStatus.when(
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) {
        return const LoginScreen();
      },
      data: (isLoggedIn) {
        if (isLoggedIn) {

          ref.watch(
            appointmentSyncServiceProvider,
          );

          return const DoctorListScreen();
        }

        return const LoginScreen();
      },
    );
  }
}