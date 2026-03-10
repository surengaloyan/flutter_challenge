import 'package:auto_route/auto_route.dart';
import 'package:flutter_challenge/presentation/screens.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(initial: true, page: SplashRoute.page, path: RoutePath.splash),
    AutoRoute(page: AuthRoute.page, path: RoutePath.authentication),
    AutoRoute(page: AuthenticatedRoute.page, path: RoutePath.authenticated),
  ];
}

class RoutePath {
  static const authentication = '/authentication';
  static const authenticated = '/authenticated';
  static const splash = '/splash';
}
