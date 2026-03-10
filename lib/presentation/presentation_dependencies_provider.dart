import 'package:flutter_challenge/presentation/store/auth_store.dart';
import 'package:get_it/get_it.dart';

class PresentationDependenciesProvider {
  PresentationDependenciesProvider({required GetIt di}) : _di = di;

  final GetIt _di;

  Future<void> initialize() async {
    _di.registerLazySingleton<AuthStore>(
      () => AuthStore(
        loginUseCase: _di(),
        signupUseCase: _di(),
        logoutUseCase: _di(),
        getActiveUsernameUseCase: _di(),
      )..checkAuth(),
    );
  }
}
