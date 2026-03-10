import 'package:flutter/material.dart';

@immutable
class ChallengeTextTheme extends ThemeExtension<ChallengeTextTheme> {
  ChallengeTextTheme({required Color textColor, required String fontFamily})
    : body1Regular = TextStyle(
        color: textColor,
        fontFamily: fontFamily,
        fontSize: 14,
      ),
      buttonMedium = TextStyle(
        color: textColor,
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  final TextStyle body1Regular;
  final TextStyle buttonMedium;

  const ChallengeTextTheme._({
    required this.body1Regular,
    required this.buttonMedium,
  });

  @override
  ChallengeTextTheme copyWith({
    TextStyle? body1Regular,
    TextStyle? buttonMedium,
  }) {
    return ChallengeTextTheme._(
      body1Regular: body1Regular ?? this.body1Regular,
      buttonMedium: buttonMedium ?? this.buttonMedium,
    );
  }

  @override
  ChallengeTextTheme lerp(ThemeExtension<ChallengeTextTheme>? other, double t) {
    if (other is! ChallengeTextTheme) {
      return this;
    }

    return ChallengeTextTheme._(
      body1Regular: TextStyle.lerp(body1Regular, other.body1Regular, t)!,
      buttonMedium: TextStyle.lerp(buttonMedium, other.buttonMedium, t)!,
    );
  }

  static ChallengeTextTheme of(BuildContext context) {
    return Theme.of(context).extension<ChallengeTextTheme>()!;
  }
}
