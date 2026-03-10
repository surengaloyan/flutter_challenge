import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/screens/authentication_screen/widgets/challenge_text_input_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
  });

  final GlobalKey formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ChallengeTextInputField(
            controller: usernameController,
            hintText: 'Username',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter the username';
              }

              return null;
            },
          ),
          const SizedBox(height: 12),
          ChallengeTextInputField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter the password';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}
