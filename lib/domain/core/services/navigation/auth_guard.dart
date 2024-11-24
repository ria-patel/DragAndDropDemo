// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';

// Project imports:
import 'package:app_demo/domain/core/constants/hive.constants.dart';
import 'package:app_demo/domain/core/services/navigation/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    String routeName = resolver.route.name;
    Box box = Hive.box(HiveConstants.hiveBox);
    String token = box.get(HiveConstants.token, defaultValue: '');

    if (token.isNotEmpty || routeName == LoginRoute.name) {
      if (token.isNotEmpty && routeName == LoginRoute.name) {
        router.replaceAll([const HomeRoute()]);
      } else {
        resolver.next(true);
      }
    } else {
      resolver.redirect(const LoginRoute());
    }
  }
}
