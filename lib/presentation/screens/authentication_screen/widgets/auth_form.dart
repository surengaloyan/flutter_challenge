import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/screens/authentication_screen/auth_screen_controllers.dart';
import 'package:flutter_challenge/presentation/store/auth_store.dart';
import 'package:flutter_challenge/presentation/screens/authentication_screen/widgets/auth_form_content.dart';
import 'package:flutter_challenge/presentation/screens/authentication_screen/widgets/auth_forms_switcher.dart';
import 'package:flutter_challenge/shared/store_factory.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

const _formHeight = 250.0;
const _formHeightWithValidationErrors = 300.0;

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  late ReactionDisposer _disposer;
  late AuthStore _authStore;
  late AuthScreenControllers _authScreenControllers;

  bool _hasValidationError = false;

  @override
  void initState() {
    super.initState();

    _authStore = context.read<StoreFactory>().get<AuthStore>();
    _authScreenControllers = AuthScreenControllers();

    _disposer = reaction((_) => _authStore.isLogin, (_) => _updateFormPage());
  }

  void _updateFormPage() {
    if (_authStore.isLogin) {
      _authScreenControllers.formPageController.previousPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    } else {
      _authScreenControllers.formPageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }

    setState(() {
      _hasValidationError = false;
    });
  }

  @override
  void dispose() {
    super.dispose();

    _authScreenControllers.disposeControllers();
    _disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => AnimatedSize(
        alignment: Alignment.bottomCenter,
        duration: Duration(milliseconds: 200),
        child: SizedBox(
          height: _hasValidationError
              ? _formHeightWithValidationErrors
              : _formHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AuthFormContent(
                authenticationScreenControllers: _authScreenControllers,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AuthFormsSwitcher(
                  isLogin: _authStore.isLogin,
                  onSwitch: _onFormSwitch,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onFormSwitch(bool isLogin) {
    if (_authStore.isLogin == isLogin) {
      _validateInputsAndProccesse(isLogin);
    } else {
      _authStore.changeIsLogin(isLogin);
      _resetValidators();
    }
  }

  void _validateInputsAndProccesse(bool isLogin) {
    if (isLogin) {
      _validateAndlogin();
    } else {
      _validateAndSignup();
    }
  }

  void _validateAndlogin() {
    if (_authScreenControllers.loginFormKey.currentState?.validate() ?? false) {
      _authStore.login(
        username: _authScreenControllers.loginUsernameController.text,
        password: _authScreenControllers.loginPasswordController.text,
      );
    } else {
      setState(() {
        _hasValidationError = true;
      });
    }
  }

  void _validateAndSignup() {
    if (_authScreenControllers.signupFormKey.currentState?.validate() ??
        false) {
      _authStore.signup(
        email: _authScreenControllers.signupEmailController.text,
        username: _authScreenControllers.signupUsernameController.text,
        password: _authScreenControllers.signupPasswordController.text,
      );
    } else {
      setState(() {
        _hasValidationError = true;
      });
    }
  }

  void _resetValidators() {
    _authScreenControllers.loginFormKey.currentState?.reset();
    _authScreenControllers.signupFormKey.currentState?.reset();
  }
}
