import 'package:flutter_challenge/data/auth/auth_repository_impl.dart';
import 'package:flutter_challenge/domain.dart';
import 'package:get_it/get_it.dart';

class DomainDependenciesProvider {
  DomainDependenciesProvider({required GetIt di}) : _di = di;

  final GetIt _di;

  Future<void> initialize() async {
    _di
      ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(authenticationLocalDataSource: _di()),
      )
      ..registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(authenticationRepository: _di()),
      )
      ..registerLazySingleton<SignupUseCase>(
        () => SignupUseCase(authenticationRepository: _di()),
      )
      ..registerLazySingleton<LogoutUseCase>(
        () => LogoutUseCase(authenticationRepository: _di()),
      )
      ..registerLazySingleton<GetActiveUsernameUseCase>(
        () => GetActiveUsernameUseCase(authenticationRepository: _di()),
      );
  }
}
