import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/screens/authentication_screen/auth_screen_controllers.dart';
import 'package:flutter_challenge/presentation/screens/authentication_screen/widgets/login_form.dart';
import 'package:flutter_challenge/presentation/screens/authentication_screen/widgets/sign_up_form.dart';

class AuthFormContent extends StatelessWidget {
  const AuthFormContent({
    super.key,

    required this.authenticationScreenControllers,
  });

  final AuthScreenControllers authenticationScreenControllers;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: authenticationScreenControllers.formPageController,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LoginForm(
              formKey: authenticationScreenControllers.loginFormKey,
              usernameController:
                  authenticationScreenControllers.loginUsernameController,
              passwordController:
                  authenticationScreenControllers.loginPasswordController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SignUpForm(
              formKey: authenticationScreenControllers.signupFormKey,
              emailController:
                  authenticationScreenControllers.signupEmailController,
              usernameController:
                  authenticationScreenControllers.signupUsernameController,
              passwordController:
                  authenticationScreenControllers.signupPasswordController,
            ),
          ),
        ],
      ),
    );
  }
}
