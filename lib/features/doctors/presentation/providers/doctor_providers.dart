import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/network/dio_provider.dart';

import '../../data/database/doctor_database.dart';

import '../../data/datasources/local/doctor_cache_data_source.dart';
import '../../data/datasources/local/doctor_cache_data_source_impl.dart';

import '../../data/datasources/remote/doctor_remote_data_source.dart';
import '../../data/datasources/remote/doctor_remote_data_source_impl.dart';

import '../../data/repositories/doctor_repository_impl.dart';

import '../../domain/repositories/doctor_repository.dart';

import '../controllers/doctor_details_controller.dart';
import '../controllers/doctor_details_state.dart';

import '../controllers/doctor_list_controller.dart';
import '../controllers/doctor_list_state.dart';

final doctorDatabaseProvider =
Provider<DoctorDatabase>((ref) {
  final database = DoctorDatabase(
    openDatabaseConnection(
      databaseName: 'medmylife_doctors',
    ),
  );

  ref.onDispose(database.close);

  return database;
});

final doctorRemoteDataSourceProvider =
Provider<DoctorRemoteDataSource>((ref) {
  return DoctorRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
});

final doctorCacheDataSourceProvider =
Provider<DoctorCacheDataSource>((ref) {
  return DoctorCacheDataSourceImpl(
    ref.watch(doctorDatabaseProvider),
  );
});

final doctorRepositoryProvider =
Provider<DoctorRepository>((ref) {
  return DoctorRepositoryImpl(
    remoteDataSource:
    ref.watch(
      doctorRemoteDataSourceProvider,
    ),
    cacheDataSource:
    ref.watch(
      doctorCacheDataSourceProvider,
    ),
  );
});

final doctorListControllerProvider =
NotifierProvider<
    DoctorListController,
    DoctorListState>(
  DoctorListController.new,
);

final doctorDetailsControllerProvider =
NotifierProvider<
    DoctorDetailsController,
    DoctorDetailsState>(
  DoctorDetailsController.new,
);