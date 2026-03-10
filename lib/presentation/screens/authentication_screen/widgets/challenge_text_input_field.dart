import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/theme.dart';

class ChallengeTextInputField extends StatelessWidget {
  const ChallengeTextInputField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ChallengeColorTheme.of(context);
    final textTheme = ChallengeTextTheme.of(context);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(width: 1, color: colorTheme.secondary),
    );

    return TextFormField(
      controller: controller,
      style: textTheme.body1Regular,
      validator: validator,
      obscureText: obscureText,
      obscuringCharacter: '●',
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.body1Regular,
        border: border,
        focusedBorder: border.copyWith(borderSide: border.borderSide.copyWith(width: 2)),
        enabledBorder: border,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
