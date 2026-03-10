import 'package:flutter_challenge/domain.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  _AuthStore({
    required LoginUseCase loginUseCase,
    required SignupUseCase signupUseCase,
    required LogoutUseCase logoutUseCase,
    required GetActiveUsernameUseCase getActiveUsernameUseCase,
  }) : _loginUseCase = loginUseCase,
       _signupUseCase = signupUseCase,
       _logoutUseCase = logoutUseCase,
       _getActiveUsernameUseCase = getActiveUsernameUseCase;

  final LoginUseCase _loginUseCase;
  final SignupUseCase _signupUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetActiveUsernameUseCase _getActiveUsernameUseCase;

  @observable
  bool isLogin = true;

  @observable
  String? authErrorMessage;

  @action
  void changeIsLogin(bool newIsLogin) {
    isLogin = newIsLogin;
  }

  @observable
  String? activeUsername;

  @computed
  bool get isAuthenticated => activeUsername != null;

  @action
  Future<void> checkAuth() async {
    final result = await _getActiveUsernameUseCase();

    activeUsername = result;
  }

  @action
  Future<void> login({
    required String username,
    required String password,
  }) async {
    final success = await _loginUseCase(username: username, password: password);

    if (success) {
      activeUsername = username;
    } else {
      authErrorMessage = 'Invalid credientails.';
    }
  }

  @action
  Future<void> signup({
    required String email,
    required String username,
    required String password,
  }) async {
    final success = await _signupUseCase(
      email: email,
      username: username,
      password: password,
    );

    if (success) {
      activeUsername = username;
    } else {
      authErrorMessage = "Couldn't signup please try again.";
    }
  }

  @action
  Future<void> logout() async {
    final success = await _logoutUseCase();

    if (success) {
      activeUsername = null;
    } else {
      authErrorMessage = "Could'nt log out, please try again";
    }
  }
}
