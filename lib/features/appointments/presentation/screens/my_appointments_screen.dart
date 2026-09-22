import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/appointment_providers.dart';
import '../widgets/appointment_card.dart';
import '../widgets/appointment_empty_state.dart';
import '../widgets/appointment_error_state.dart';
import 'appointment_queue_screen.dart';

class MyAppointmentsScreen extends ConsumerWidget {
  const MyAppointmentsScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final appointmentsState = ref.watch(
      myAppointmentsProvider,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),

        actions: [
          IconButton(
            tooltip: 'Offline Appointments',
            icon: const Icon(
              Icons.cloud_off_outlined,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const AppointmentQueueScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: appointmentsState.when(
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },

        error: (error, stackTrace) {
          return AppointmentErrorState(
            message: 'Failed to load appointments.',
            onRetry: () {
              ref.invalidate(
                myAppointmentsProvider,
              );
            },
          );
        },

        data: (appointments) {
          if (appointments.isEmpty) {
            return const AppointmentEmptyState(
              icon: Icons.calendar_today_outlined,
              title: 'No appointments yet',
              message:
              'Your booked appointments will appear here.',
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(
                myAppointmentsProvider,
              );

              await ref.read(
                myAppointmentsProvider.future,
              );
            },

            child: ListView.separated(
              physics:
              const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: appointments.length,

              separatorBuilder: (_, __) {
                return const SizedBox(height: 12);
              },

              itemBuilder: (context, index) {
                return AppointmentCard(
                  appointment: appointments[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}