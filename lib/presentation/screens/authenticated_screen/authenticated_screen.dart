import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/store/auth_store.dart';
import 'package:flutter_challenge/presentation/theme.dart';
import 'package:flutter_challenge/shared/store_factory.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AuthenticatedScreen extends StatelessWidget {
  const AuthenticatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = ChallengeColorTheme.of(context);
    final textTheme = ChallengeTextTheme.of(context);
    final authStore = context
        .read<StoreFactory>()
        .get<AuthStore>();

    return Scaffold(
      backgroundColor: colorTheme.backgroundPrimary,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => Text(
                'Hello ${authStore.activeUsername}',
                style: textTheme.body1Regular,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colorTheme.primary),
              ),
              onPressed: () => authStore.logout(),
              child: Text('Log out', style: textTheme.buttonMedium),
            ),
          ],
        ),
      ),
    );
  }
}
