// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';

// Project imports:
import 'package:app_demo/domain/core/constants/hive.constants.dart';
import 'package:app_demo/domain/core/services/navigation/app_router.gr.dart';
import 'package:app_demo/domain/core/services/navigation/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  Box box = Hive.box(HiveConstants.hiveBox);

  @override
  late final List<AutoRouteGuard> guards = [AuthGuard()];

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          initial: box
              .get(HiveConstants.token, defaultValue: '')
              .toString()
              .isNotEmpty,
          page: HomeRoute.page,
          type: const RouteType.adaptive(),
        ),
        AutoRoute(
          path: '/login',
          initial:
              box.get(HiveConstants.token, defaultValue: '').toString().isEmpty,
          page: LoginRoute.page,
          type: const RouteType.adaptive(),
        ),
      ];
}
