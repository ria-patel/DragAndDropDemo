// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool enabled;
  final bool autofocus;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final String hintText;
  final String labelText;
  final double? labelSize;
  final String? errorText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? padding;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmitted;
  final List<TextInputFormatter>? textInputFormatter;
  final TextStyle? hintTextStyle;
  final AutovalidateMode? autovalidateMode;
  final Function()? onTap;
  final bool readOnly;
  final bool isRequired;
  final bool removeBorder;
  final Iterable<String>? autoFillHints;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    this.enabled = true,
    this.padding,
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.maxLength,
    this.hintText = '',
    this.labelText = '',
    this.obscureText = false,
    this.labelSize,
    this.errorText,
    this.initialValue,
    this.keyboardType,
    this.onChanged,
    this.textInputAction,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.textInputFormatter,
    this.hintTextStyle,
    this.autovalidateMode,
    this.onTap,
    this.readOnly = false,
    this.isRequired = false,
    this.removeBorder = false,
    this.autoFillHints,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      gapPadding: 0,
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.grey.shade600,
        width: 0,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText.isNotEmpty) ...[
          Row(
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontSize: labelSize ?? 14,
                  color: Colors.black,
                ),
              ),
              Text(
                isRequired ? '*' : '',
                style: TextStyle(
                  fontSize: labelSize ?? 14,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
        TextFormField(
          focusNode: focusNode,
          autofillHints: autoFillHints ?? [],
          readOnly: readOnly,
          onTap: onTap,
          enabled: enabled,
          maxLines: maxLines ?? 1,
          obscureText: obscureText,
          onChanged: onChanged,
          autofocus: autofocus,
          maxLength: maxLength,
          validator: validator,
          controller: controller,
          initialValue: initialValue,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: textInputFormatter ?? [],
          cursorColor: Colors.deepPurple,
          textAlignVertical: TextAlignVertical.center,
          autovalidateMode:
              autovalidateMode ?? AutovalidateMode.onUserInteraction,
          style: TextStyle(
            color: enabled ? Colors.black : Colors.grey,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            counterText: maxLength != null ? null : '',
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            helperStyle: const TextStyle(height: 0),
            alignLabelWithHint: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: padding ?? const EdgeInsets.all(16),
            hintStyle: hintTextStyle ??
                TextStyle(
                  color: enabled ? Colors.grey : Colors.grey.shade300,
                  fontSize: 14,
                ),
            fillColor: Colors.white,
            border: removeBorder ? InputBorder.none : outlineInputBorder,
            enabledBorder: removeBorder ? InputBorder.none : outlineInputBorder,
            disabledBorder: removeBorder
                ? InputBorder.none
                : outlineInputBorder.copyWith(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
            focusedBorder: removeBorder
                ? InputBorder.none
                : outlineInputBorder.copyWith(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
            errorBorder: removeBorder
                ? InputBorder.none
                : outlineInputBorder.copyWith(
                    borderSide: const BorderSide(color: Colors.red),
                  ),
            focusedErrorBorder: removeBorder
                ? InputBorder.none
                : outlineInputBorder.copyWith(
                    borderSide: const BorderSide(color: Colors.red),
                  ),
            errorText: errorText,
            errorStyle: const TextStyle(
              fontSize: 12,
              color: Colors.red,
              overflow: TextOverflow.clip,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}
