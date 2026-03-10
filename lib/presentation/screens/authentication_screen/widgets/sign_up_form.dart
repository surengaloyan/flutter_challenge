import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/screens/authentication_screen/widgets/challenge_text_input_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
  });

  final GlobalKey formKey;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChallengeTextInputField(
            controller: emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email';
              }

              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email';
              }

              return null;
            },
          ),
          const SizedBox(height: 12),
          ChallengeTextInputField(
            controller: usernameController,
            hintText: 'Username',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your name';
              }

              if (value.trim().length < 3) {
                return 'Username should be at least 3 characters';
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
                return 'Please enter your password';
              }

              if (value.trim().length < 6) {
                return 'Username should be at least 6 characters';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}
