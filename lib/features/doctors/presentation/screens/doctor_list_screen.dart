import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../appointments/presentation/screens/my_appointments_screen.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

import '../../domain/entities/doctor.dart';

import '../controllers/doctor_list_controller.dart';
import '../providers/doctor_providers.dart';

import '../widgets/doctor_card.dart';

class DoctorListScreen extends ConsumerStatefulWidget {
  const DoctorListScreen({super.key});

  @override
  ConsumerState<DoctorListScreen> createState() =>
      _DoctorListScreenState();
}

class _DoctorListScreenState
    extends ConsumerState<DoctorListScreen> {
  final _searchController = TextEditingController();

  bool _showSearch = true;
  double _lastScrollOffset = 0;

  DoctorListController get _controller =>
      ref.read(
        doctorListControllerProvider.notifier,
      );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() {});

    if (value.trim().isEmpty) {
      _controller.clearSearch();
      return;
    }

    _controller.search(value);
  }

  void _clearSearch() {
    _searchController.clear();
    _controller.clearSearch();

    setState(() {});
  }

  Future<void> _showLogoutDialog() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text(
            'Are you sure you want to logout?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      await _logout();
    }
  }

  Future<void> _logout() async {
    await ref
        .read(authControllerProvider.notifier)
        .logout();
  }

  void _handleScrollNotification(
      ScrollNotification notification,
      ) {
    if (notification.metrics.axis != Axis.vertical) {
      return;
    }

    final currentOffset = notification.metrics.pixels;

    if (currentOffset <= 0) {
      if (!_showSearch) {
        setState(() {
          _showSearch = true;
        });
      }

      _lastScrollOffset = currentOffset;
      return;
    }

    if (currentOffset > _lastScrollOffset) {
      if (_showSearch) {
        setState(() {
          _showSearch = false;
        });
      }
    } else if (currentOffset < _lastScrollOffset) {
      if (!_showSearch) {
        setState(() {
          _showSearch = true;
        });
      }
    }

    _lastScrollOffset = currentOffset;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      doctorListControllerProvider,
    );

    final controller = _controller;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Doctors'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                    const MyAppointmentsScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.calendar_month_outlined,
              ),
              tooltip: 'My Bookings',
            ),
            IconButton(
              onPressed: _showLogoutDialog,
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
            ),
          ],
        ),
      body: Column(
        children: [
          if (state.isOffline)
            _buildOfflineBanner(),

          AnimatedContainer(
            duration: const Duration(
              milliseconds: 250,
            ),
            curve: Curves.easeInOut,
            height: _showSearch ? 72 : 0,
            child: ClipRect(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  8,
                  16,
                  8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  textInputAction:
                  TextInputAction.search,
                  decoration: InputDecoration(
                    hintText:
                    'Search doctors or speciality',
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon:
                    _searchController.text.isNotEmpty
                        ? IconButton(
                      onPressed:
                      _clearSearch,
                      icon: const Icon(
                        Icons.clear,
                      ),
                    )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: RefreshIndicator(

              onRefresh: controller.refresh,

              child: NotificationListener<
                  ScrollNotification>(
                onNotification: (notification) {
                  _handleScrollNotification(
                    notification,
                  );

                  return false;
                },
                child: PagingListener<int, Doctor>(
                  controller:
                  controller.pagingController,
                  builder: (
                      context,
                      pagingState,
                      fetchNextPage,
                      ) {
                    return PagedListView<int, Doctor>(
                      state: pagingState,
                      fetchNextPage: fetchNextPage,
                      physics:
                      const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 16,
                      ),
                      builderDelegate:
                      PagedChildBuilderDelegate<Doctor>(
                        itemBuilder: (
                            context,
                            doctor,
                            index,
                            ) {
                          return DoctorCard(
                            doctor: doctor,
                          );
                        },

                        firstPageProgressIndicatorBuilder:
                            (_) {
                          return const Center(
                            child:
                            CircularProgressIndicator(),
                          );
                        },

                        newPageProgressIndicatorBuilder:
                            (_) {
                          return const Padding(
                            padding:
                            EdgeInsets.all(16),
                            child: Center(
                              child:
                              CircularProgressIndicator(),
                            ),
                          );
                        },


                        firstPageErrorIndicatorBuilder:
                            (context) {
                          return _buildErrorState(
                            context,
                            fetchNextPage,
                          );
                        },


                        newPageErrorIndicatorBuilder:
                            (context) {
                          return _buildLoadMoreError(
                            context,
                            fetchNextPage,
                          );
                        },

                        noItemsFoundIndicatorBuilder:
                            (_) {
                          return const Center(
                            child: Text(
                              'No doctors found',
                            ),
                          );
                        },

                        noMoreItemsIndicatorBuilder:
                            (_) {
                          return const SizedBox.shrink();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      color: Colors.orange.shade100,
      child: const Row(
        children: [
          Icon(
            Icons.cloud_off,
            size: 18,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'You are offline. Showing cached doctors.',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(
      BuildContext context,
      void Function() retry,
      ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'Unable to load doctors.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: retry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadMoreError(
      BuildContext context,
      void Function() retry,
      ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Unable to load more doctors.',
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: retry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}