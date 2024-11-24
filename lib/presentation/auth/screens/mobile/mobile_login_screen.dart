// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app_demo/presentation/auth/widgets/login_view.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: LoginView(isFromMobile: true),
        ),
      ),
    );
  }
}
