import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/screens/authentication_screen/widgets/auth_decorator.dart';
import 'package:flutter_challenge/presentation/screens/authentication_screen/widgets/auth_form.dart';
import 'package:flutter_challenge/presentation/theme.dart';

const _authDecoratorHeight = 257.0;

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = ChallengeColorTheme.of(context);
    final textTheme = ChallengeTextTheme.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: colorTheme.backgroundPrimary,
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: _authDecoratorHeight,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: AuthDecorator(),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 54,
                      left: 24,
                      child: Image.asset(
                        'assets/images/logo.webp',
                        width: 49,
                        height: 48,
                      ),
                    ),
                  ],
                ),
              ),
              AuthForm(),
              const SizedBox(height: 42),
              TextButton(
                onPressed: () {},
                child: Text('Forgot password?', style: textTheme.buttonMedium),
              ),
              const SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }
}
