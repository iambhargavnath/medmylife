import '../../domain/repositories/auth_repository.dart';
import '../../domain/exceptions/auth_exceptions.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email != 'user@example.com' || password != 'password') {
      throw const InvalidCredentialsException(
        'Invalid email or password',
      );
    }
  }
}