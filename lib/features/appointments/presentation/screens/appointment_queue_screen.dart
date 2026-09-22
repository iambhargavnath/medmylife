import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/appointment_providers.dart';
import '../widgets/appointment_empty_state.dart';
import '../widgets/appointment_error_state.dart';
import '../widgets/queued_appointment_card.dart';

class AppointmentQueueScreen
    extends ConsumerStatefulWidget {
  const AppointmentQueueScreen({
    super.key,
  });

  @override
  ConsumerState<AppointmentQueueScreen> createState() =>
      _AppointmentQueueScreenState();
}

class _AppointmentQueueScreenState
    extends ConsumerState<AppointmentQueueScreen> {
  final Set<String> _retryingIds = {};

  Future<void> _retryAppointment(
      String appointmentId,
      ) async {
    setState(() {
      _retryingIds.add(appointmentId);
    });

    try {
      await ref
          .read(appointmentSyncServiceProvider)
          .retry(appointmentId);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Appointment synced successfully',
            ),
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Appointment sync failed',
            ),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _retryingIds.remove(appointmentId);
        });

        ref.invalidate(
          queuedAppointmentsProvider,
        );
      }
    }
  }

  Future<void> _syncAppointments() async {
    try {
      await ref
          .read(appointmentSyncServiceProvider)
          .syncPendingAppointments();

      ref.invalidate(
        queuedAppointmentsProvider,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sync completed'),
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sync failed'),
          ),
        );
      }
    }
  }


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(
        queuedAppointmentsProvider,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    final queueAsync = ref.watch(
      queuedAppointmentsProvider,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Offline Appointments',
        ),

        actions: [
          IconButton(
            onPressed: _syncAppointments,
            tooltip: 'Sync',
            icon: const Icon(Icons.sync),
          ),
        ],
      ),

      body: queueAsync.when(
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },

        error: (error, stackTrace) {
          return AppointmentErrorState(
            message: 'Unable to load appointments',
            onRetry: () {
              ref.invalidate(
                queuedAppointmentsProvider,
              );
            },
          );
        },

        data: (appointments) {
          if (appointments.isEmpty) {
            return const AppointmentEmptyState(
              icon: Icons.cloud_done_outlined,
              title: 'No queued appointments',
              message:
              'Offline appointments will appear here.',
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(
                queuedAppointmentsProvider,
              );

              await ref.read(
                queuedAppointmentsProvider.future,
              );
            },

            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: appointments.length,

              separatorBuilder: (_, __) {
                return const SizedBox(height: 12);
              },

              itemBuilder: (context, index) {
                final item = appointments[index];

                return QueuedAppointmentCard(
                  item: item,
                  isRetrying: _retryingIds.contains(
                    item.appointment.id,
                  ),
                  onRetry: () {
                    _retryAppointment(
                      item.appointment.id,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}