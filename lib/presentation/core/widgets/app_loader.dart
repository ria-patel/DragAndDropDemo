// ignore_for_file: prefer_const_constructors

// Flutter imports:
import 'package:flutter/material.dart';

class AppLoader {
  static Widget show() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget modalProgressLoader() {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      color: Colors.transparent,
      child: CircularProgressIndicator(),
    );
  }
}

class AppLoaderOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const AppLoaderOverlay({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading) AppLoader.modalProgressLoader(),
      ],
    );
  }
}
