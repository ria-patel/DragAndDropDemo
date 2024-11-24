// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_demo/presentation/auth/screens/login_screen.dart' as _i2;
import 'package:app_demo/presentation/home/home_screen.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i3;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i3.PageRouteInfo<void> {
  const LoginRoute({List<_i3.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreen();
    },
  );
}
