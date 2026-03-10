import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/theme/challenge_color_theme.dart';
import 'package:flutter_challenge/presentation/theme/challenge_text_theme.dart';

class ChallengeTheme {
  static ThemeData dark() {
    final colorTheme = ColorTheme.dark();
    final textTheme = _textTheme(textColor: colorTheme.foregroundPrimary);

    return _theme(colorTheme: colorTheme, textTheme: textTheme);
  }

  static ThemeData light() {
    final colorTheme = ColorTheme.light();
    final textTheme = _textTheme(textColor: colorTheme.foregroundPrimary);

    return _theme(colorTheme: colorTheme, textTheme: textTheme);
  }

  static ThemeData _theme({
    required ChallengeColorTheme colorTheme,
    required ChallengeTextTheme textTheme,
  }) {
    return ThemeData(extensions: [colorTheme, textTheme]);
  }

  static ChallengeTextTheme _textTheme({required Color textColor}) {
    final textTheme = ChallengeTextTheme(
      textColor: textColor,
      fontFamily: 'TTNormsPro',
    );

    return textTheme;
  }
}
