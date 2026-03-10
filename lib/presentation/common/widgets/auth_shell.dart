import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/router/app_router.dart';
import 'package:flutter_challenge/presentation/store/auth_store.dart';
import 'package:flutter_challenge/presentation/theme/challenge_text_theme.dart';
import 'package:flutter_challenge/shared/store_factory.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class AuthShell extends StatefulWidget {
  const AuthShell({super.key, required this.child, required this.appRouter});

  final Widget child;
  final AppRouter appRouter;

  @override
  State<AuthShell> createState() => _AuthShellState();
}

class _AuthShellState extends State<AuthShell> {
  late AuthStore _authStore;

  @override
  void initState() {
    super.initState();

    _authStore = context.read<StoreFactory>().get<AuthStore>();

    autorun((_) {
      _trackAuthStateChanges();
      _trackErrors();
    });
  }

  void _trackAuthStateChanges() {
    if (_authStore.isAuthenticated) {
      widget.appRouter.replace(AuthenticatedRoute());
    } else {
      widget.appRouter.replace(AuthRoute());
    }
  }

  void _trackErrors() {
    if (_authStore.authErrorMessage != null) {
      _showErrorMessage();
    }
  }

  void _showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _authStore.authErrorMessage!,
          style: ChallengeTextTheme.of(context).body1Regular,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
