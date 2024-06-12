import 'package:flutter/material.dart';

// App default typographys

class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  final TextStyle body;
  final TextStyle bodySemibold;
  final TextStyle bodyLarge;
  final TextStyle bodyLargeSemiBold;
  final TextStyle bodySmall;
  final TextStyle bodySmallSemiBold;
  final TextStyle h1;
  final TextStyle h1SemiBold;
  final TextStyle h1Bold;
  final TextStyle h2SemiBold;

  AppTypographyExtension({
    required this.body,
    required this.bodyLarge,
    required this.bodySemibold,
    required this.bodyLargeSemiBold,
    required this.bodySmall,
    required this.bodySmallSemiBold,
    required this.h1,
    required this.h1SemiBold,
    required this.h1Bold,
    required this.h2SemiBold,
  });

  @override
  ThemeExtension<AppTypographyExtension> copyWith({
    TextStyle? body,
    TextStyle? bodyWhite,
    TextStyle? bodySemibold,
    TextStyle? bodyLarge,
    TextStyle? bodyLargeSemiBold,
    TextStyle? bodySmall,
    TextStyle? bodySmallSemiBold,
    TextStyle? h1,
    TextStyle? h1SemiBold,
    TextStyle? h1Bold,
    TextStyle? h2,
    TextStyle? h2SemiBold,
    TextStyle? h2Bold,
    TextStyle? h3,
    TextStyle? h3SemiBold,
    TextStyle? h3Bold,
    TextStyle? buttonText,
  }) {
    return AppTypographyExtension(
      body: body ?? this.body,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodySemibold: bodySemibold ?? this.bodySemibold,
      bodyLargeSemiBold: bodyLargeSemiBold ?? this.bodyLargeSemiBold,
      bodySmall: bodySmall ?? this.bodySmall,
      bodySmallSemiBold: bodySmallSemiBold ?? this.bodySmallSemiBold,
      h1: h1 ?? this.h1,
      h1SemiBold: h1SemiBold ?? this.h1SemiBold,
      h1Bold: h1Bold ?? this.h1Bold,
      h2SemiBold: h2SemiBold ?? this.h2SemiBold,
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> lerp(
      covariant ThemeExtension<AppTypographyExtension>? other, double t) {
    if (other is! AppTypographyExtension) {
      return this;
    }
    return AppTypographyExtension(
      body: TextStyle.lerp(body, other.body, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodySemibold: TextStyle.lerp(bodySemibold, other.bodySemibold, t)!,
      bodyLargeSemiBold:
          TextStyle.lerp(bodyLargeSemiBold, other.bodyLargeSemiBold, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      bodySmallSemiBold:
          TextStyle.lerp(bodySmallSemiBold, other.bodySmallSemiBold, t)!,
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h1SemiBold: TextStyle.lerp(h1SemiBold, other.h1SemiBold, t)!,
      h1Bold: TextStyle.lerp(h1Bold, other.h1Bold, t)!,
      h2SemiBold: TextStyle.lerp(h2SemiBold, other.h2SemiBold, t)!,
    );
  }
}
