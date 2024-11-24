// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final bool isDisabled;
  final VoidCallback onPressed;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? textColor;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
    this.width,
    this.padding,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? Colors.deepPurple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: kIsWeb ? 18 : 12,
              ),
        ),
        child: Text(
          title,
          style: TextStyle(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
