// Flutter imports:
import 'package:flutter/material.dart';

class LabelView extends StatelessWidget {
  final String text;

  const LabelView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        textAlign: TextAlign.left,
      ),
    );
  }
}
