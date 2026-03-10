import 'package:flutter_challenge/domain/auth.dart';

class GetActiveUsernameUseCase {
  const GetActiveUsernameUseCase({
    required AuthRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthRepository _authenticationRepository;

  Future<String?> call() {
    return _authenticationRepository.getActiveUsername();
  }
}
