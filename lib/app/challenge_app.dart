import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/presentation/common/widgets/auth_shell.dart';
import 'package:flutter_challenge/presentation/router/app_router.dart';
import 'package:flutter_challenge/presentation/theme.dart';
import 'package:flutter_challenge/shared/common_dependencies_provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ChallengeApp extends StatefulWidget {
  const ChallengeApp({super.key, required this.di});

  final GetIt di;

  @override
  State<ChallengeApp> createState() => _ChallengeAppState();
}

class _ChallengeAppState extends State<ChallengeApp> {
  late AppRouter _router;

  @override
  void initState() {
    super.initState();

    _router = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => CommonDependenciesProvider(
        di: widget.di,
        child: MaterialApp.router(
          darkTheme: ChallengeTheme.dark(),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          routerConfig: _router.config(),
          theme: ChallengeTheme.light(),
          color: Colors.transparent,
          builder: (context, child) {
            final brightness = ChallengeColorTheme.of(context).brightness;

            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                statusBarIconBrightness: brightness == Brightness.dark
                    ? Brightness.light
                    : Brightness.dark,
                statusBarBrightness: brightness == Brightness.dark
                    ? Brightness.dark
                    : Brightness.light,
                statusBarColor: Colors.transparent,
              ),
            );

            return AuthShell(
              appRouter: _router,
              child: child ?? const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
