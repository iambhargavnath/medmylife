import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/mock_auth_repository.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/datasources/auth_local_data_source.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return MockAuthRepository();
});

final authLocalDataSourceProvider =
Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSource();
});

final authStatusProvider = FutureProvider<bool>((ref) async {
  final localDataSource = ref.read(
    authLocalDataSourceProvider,
  );

  return localDataSource.isLoggedIn();
});