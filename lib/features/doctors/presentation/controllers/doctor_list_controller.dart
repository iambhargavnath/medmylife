import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../domain/entities/doctor.dart';
import '../../domain/repositories/doctor_repository.dart';

import '../providers/doctor_providers.dart';
import 'doctor_list_state.dart';

class DoctorListController
    extends Notifier<DoctorListState> {
  static const int pageSize = 10;

  late PagingController<int, Doctor> pagingController;

  Timer? _searchDebounce;

  DoctorRepository get _repository =>
      ref.read(doctorRepositoryProvider);

  @override
  DoctorListState build() {
    pagingController = PagingController<int, Doctor>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) {
          return null;
        }

        return state.nextIntPageKey;
      },
      fetchPage: _fetchPage,
    );

    ref.onDispose(() {
      _searchDebounce?.cancel();
      pagingController.dispose();
    });

    return const DoctorListState();
  }

  Future<List<Doctor>> _fetchPage(
      int pageKey,
      ) async {
    final offset = (pageKey - 1) * pageSize;

    try {
      final result = await _repository.getDoctors(
        limit: pageSize,
        offset: offset,
        query: state.query,
      );

      state = state.copyWith(
        isOffline: result.isFromCache,
      );

      return result.doctors;
    } catch (error, stackTrace) {
      debugPrint(
        'Doctor loading error: $error',
      );

      debugPrintStack(
        stackTrace: stackTrace,
      );

      state = state.copyWith(
        isOffline: false,
      );

      rethrow;
    }
  }

  void search(String value) {
    _searchDebounce?.cancel();

    state = state.copyWith(
      query: value.trim(),
      isOffline: false,
    );

    _searchDebounce = Timer(
      const Duration(milliseconds: 300),
          () {
        pagingController.refresh();
      },
    );
  }

  void clearSearch() {
    _searchDebounce?.cancel();

    state = state.copyWith(
      query: '',
      isOffline: false,
    );

    pagingController.refresh();
  }

  Future<void> refresh() async {
    state = state.copyWith(
      isOffline: false,
    );

    try {
      await _repository.syncDoctors();

      pagingController.refresh();
    } catch (error, stackTrace) {
      debugPrint(
        'Doctor refresh error: $error',
      );

      debugPrintStack(
        stackTrace: stackTrace,
      );

      rethrow;
    }
  }
}