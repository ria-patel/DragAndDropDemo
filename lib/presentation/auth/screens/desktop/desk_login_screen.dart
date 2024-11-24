// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app_demo/presentation/auth/widgets/login_view.dart';

class DeskLoginScreen extends StatelessWidget {
  const DeskLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: FittedBox(child: LoginView()),
        ),
      ),
    );
  }
}
