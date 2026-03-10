import 'package:flutter_challenge/domain/auth.dart';

class LogoutUseCase {
  const LogoutUseCase({required AuthRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  final AuthRepository _authenticationRepository;

  Future<bool> call() {
    return _authenticationRepository.logout();
  }
}
