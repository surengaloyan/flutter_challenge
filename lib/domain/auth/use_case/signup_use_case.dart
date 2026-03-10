import 'package:flutter_challenge/domain/auth.dart';

class SignupUseCase {
  const SignupUseCase({required AuthRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  final AuthRepository _authenticationRepository;

  Future<bool> call({
    required String email,
    required String username,
    required String password,
  }) {
    return _authenticationRepository.signup(
      email: email,
      username: username,
      password: password,
    );
  }
}
