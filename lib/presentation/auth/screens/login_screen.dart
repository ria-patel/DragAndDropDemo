// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Project imports:
import 'package:app_demo/application/auth/login/login_bloc.dart';
import 'package:app_demo/infrastructure/core/di.dart';
import 'package:app_demo/presentation/auth/screens/desktop/desk_login_screen.dart';
import 'package:app_demo/presentation/auth/screens/mobile/mobile_login_screen.dart';
import 'package:app_demo/presentation/core/widgets/app_loader.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return AppLoaderOverlay(
            isLoading: state.isLoading,
            child: ScreenTypeLayout.builder(
              mobile: (BuildContext context) => const MobileLoginScreen(),
              tablet: (BuildContext context) => const MobileLoginScreen(),
              desktop: (BuildContext context) => const DeskLoginScreen(),
            ),
          );
        },
      ),
    );
  }
}
