import 'package:flutter_challenge/domain/auth.dart';

class LoginUseCase {
  const LoginUseCase({required AuthRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  final AuthRepository _authenticationRepository;

  Future<bool> call({required String username, required String password}) {
    return _authenticationRepository.login(
      username: username,
      password: password,
    );
  }
}
