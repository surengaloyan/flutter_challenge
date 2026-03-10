import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/theme/challenge_colors.dart';

class ColorTheme {
  static ChallengeColorTheme light() {
    return ChallengeColorTheme(
      brightness: Brightness.light,
      backgroundPrimary: ChallengeColors.brightSnow,
      backgroundSecondary: ChallengeColors.icyBlue,
      primary: ChallengeColors.fullSpectrumBlue,
      secondary: ChallengeColors.oceanTwilight,
      foregroundPrimary: ChallengeColors.shadowGrey,
      foregroundSecondary: ChallengeColors.white,
    );
  }

  static ChallengeColorTheme dark() {
    return ChallengeColorTheme(
      brightness: Brightness.dark,
      backgroundPrimary: ChallengeColors.carbonBlack,
      backgroundSecondary: ChallengeColors.deepSpaceBlue,
      primary: ChallengeColors.fullSpectrumBlue,
      secondary: ChallengeColors.royalBlue,
      foregroundPrimary: ChallengeColors.white,
      foregroundSecondary: ChallengeColors.shadowGrey,
    );
  }
}

@immutable
class ChallengeColorTheme extends ThemeExtension<ChallengeColorTheme> {
  const ChallengeColorTheme({
    required this.brightness,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.primary,
    required this.secondary,
    required this.foregroundPrimary,
    required this.foregroundSecondary,
  });

  final Brightness brightness;
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color primary;
  final Color secondary;
  final Color foregroundPrimary;
  final Color foregroundSecondary;

  @override
  ChallengeColorTheme copyWith({
    Brightness? brightness,
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? primary,
    Color? secondary,
    Color? foregroundPrimary,
    Color? foregroundSecondary,
  }) {
    return ChallengeColorTheme(
      brightness: brightness ?? this.brightness,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      foregroundPrimary: foregroundPrimary ?? this.foregroundPrimary,
      foregroundSecondary: foregroundSecondary ?? this.foregroundSecondary,
    );
  }

  @override
  ChallengeColorTheme lerp(ThemeExtension<ChallengeColorTheme>? other, double t) {
    if (other is! ChallengeColorTheme) {
      return this;
    }

    return ChallengeColorTheme(
      brightness: t < 0.5 ? Brightness.dark : Brightness.light,

      backgroundPrimary: Color.lerp(
        backgroundPrimary,
        other.backgroundPrimary,
        t,
      )!,
      backgroundSecondary: Color.lerp(
        backgroundSecondary,
        other.backgroundSecondary,
        t,
      )!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      foregroundPrimary: Color.lerp(
        foregroundPrimary,
        other.foregroundPrimary,
        t,
      )!,
      foregroundSecondary: Color.lerp(
        foregroundSecondary,
        other.foregroundSecondary,
        t,
      )!,
    );
  }

  static ChallengeColorTheme of(BuildContext context) {
    return Theme.of(context).extension<ChallengeColorTheme>()!;
  }
}
