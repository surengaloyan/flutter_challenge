import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/theme/challenge_color_theme.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = ChallengeColorTheme.of(context);
    return Scaffold(
      backgroundColor: colorTheme.backgroundPrimary,
      body: Center(child: Image.asset('assets/images/logo.webp', width: 200, height: 200)),
    );
  }
}
