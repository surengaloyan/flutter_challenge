// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated => (_$isAuthenticatedComputed ??= Computed<bool>(
    () => super.isAuthenticated,
    name: '_AuthStore.isAuthenticated',
  )).value;

  late final _$isLoginAtom = Atom(name: '_AuthStore.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  late final _$authErrorMessageAtom = Atom(
    name: '_AuthStore.authErrorMessage',
    context: context,
  );

  @override
  String? get authErrorMessage {
    _$authErrorMessageAtom.reportRead();
    return super.authErrorMessage;
  }

  @override
  set authErrorMessage(String? value) {
    _$authErrorMessageAtom.reportWrite(value, super.authErrorMessage, () {
      super.authErrorMessage = value;
    });
  }

  late final _$activeUsernameAtom = Atom(
    name: '_AuthStore.activeUsername',
    context: context,
  );

  @override
  String? get activeUsername {
    _$activeUsernameAtom.reportRead();
    return super.activeUsername;
  }

  @override
  set activeUsername(String? value) {
    _$activeUsernameAtom.reportWrite(value, super.activeUsername, () {
      super.activeUsername = value;
    });
  }

  late final _$checkAuthAsyncAction = AsyncAction(
    '_AuthStore.checkAuth',
    context: context,
  );

  @override
  Future<void> checkAuth() {
    return _$checkAuthAsyncAction.run(() => super.checkAuth());
  }

  late final _$loginAsyncAction = AsyncAction(
    '_AuthStore.login',
    context: context,
  );

  @override
  Future<void> login({required String username, required String password}) {
    return _$loginAsyncAction.run(
      () => super.login(username: username, password: password),
    );
  }

  late final _$signupAsyncAction = AsyncAction(
    '_AuthStore.signup',
    context: context,
  );

  @override
  Future<void> signup({
    required String email,
    required String username,
    required String password,
  }) {
    return _$signupAsyncAction.run(
      () => super.signup(email: email, username: username, password: password),
    );
  }

  late final _$logoutAsyncAction = AsyncAction(
    '_AuthStore.logout',
    context: context,
  );

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_AuthStoreActionController = ActionController(
    name: '_AuthStore',
    context: context,
  );

  @override
  void changeIsLogin(bool newIsLogin) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
      name: '_AuthStore.changeIsLogin',
    );
    try {
      return super.changeIsLogin(newIsLogin);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin},
authErrorMessage: ${authErrorMessage},
activeUsername: ${activeUsername},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
