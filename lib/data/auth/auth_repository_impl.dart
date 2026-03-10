import 'package:flutter_challenge/data/auth/data_source/auth_local_data_source.dart';
import 'package:flutter_challenge/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required AuthLocalDataSource authenticationLocalDataSource,
  }) : _authenticationLocalDataSource = authenticationLocalDataSource;

  final AuthLocalDataSource _authenticationLocalDataSource;

  @override
  Future<bool> login({required String username, required String password}) {
    return _authenticationLocalDataSource.login(
      username: username,
      password: password,
    );
  }

  @override
  Future<bool> signup({
    required String email,
    required String username,
    required String password,
  }) {
    return _authenticationLocalDataSource.signup(
      email: email,
      username: username,
      password: password,
    );
  }

  @override
  Future<String?> getActiveUsername() {
    return _authenticationLocalDataSource.getActiveUsername();
  }

  @override
  Future<bool> logout() {
    return _authenticationLocalDataSource.logout();
  }
}
