import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6d5e0f),
      surfaceTint: Color(0xff6d5e0f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff5e287),
      onPrimaryContainer: Color(0xff221b00),
      secondary: Color(0xff665e40),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffede1bc),
      onSecondaryContainer: Color(0xff211b04),
      tertiary: Color(0xff43664e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc5ecce),
      onTertiaryContainer: Color(0xff00210f),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffef9f0),
      onSurface: Color(0xff1d1c16),
      onSurfaceVariant: Color(0xff4a4739),
      outline: Color(0xff7b7768),
      outlineVariant: Color(0xffccc5b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff32302a),
      onInverseSurface: Color(0xfff5f0e7),
      inversePrimary: Color(0xffd8c66e),
      primaryFixed: Color(0xfff5e287),
      onPrimaryFixed: Color(0xff221b00),
      primaryFixedDim: Color(0xffd8c66e),
      onPrimaryFixedVariant: Color(0xff524600),
      secondaryFixed: Color(0xffede1bc),
      onSecondaryFixed: Color(0xff211b04),
      secondaryFixedDim: Color(0xffd0c5a1),
      onSecondaryFixedVariant: Color(0xff4e462a),
      tertiaryFixed: Color(0xffc5ecce),
      onTertiaryFixed: Color(0xff00210f),
      tertiaryFixedDim: Color(0xffa9d0b3),
      onTertiaryFixedVariant: Color(0xff2c4e37),
      surfaceDim: Color(0xffded9d0),
      surfaceBright: Color(0xfffef9f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f3ea),
      surfaceContainer: Color(0xfff2ede4),
      surfaceContainerHigh: Color(0xffece7de),
      surfaceContainerHighest: Color(0xffe6e2d9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4e4200),
      surfaceTint: Color(0xff6d5e0f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff847426),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4a4226),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7c7456),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff284a33),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff597d63),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef9f0),
      onSurface: Color(0xff1d1c16),
      onSurfaceVariant: Color(0xff464335),
      outline: Color(0xff635f51),
      outlineVariant: Color(0xff7f7b6c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff32302a),
      onInverseSurface: Color(0xfff5f0e7),
      inversePrimary: Color(0xffd8c66e),
      primaryFixed: Color(0xff847426),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6a5b12),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7c7456),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff625b3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff597d63),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff41644b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded9d0),
      surfaceBright: Color(0xfffef9f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f3ea),
      surfaceContainer: Color(0xfff2ede4),
      surfaceContainerHigh: Color(0xffece7de),
      surfaceContainerHighest: Color(0xffe6e2d9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff292200),
      surfaceTint: Color(0xff6d5e0f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4e4200),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff272107),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4a4226),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff062815),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff284a33),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef9f0),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff262418),
      outline: Color(0xff464335),
      outlineVariant: Color(0xff464335),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff32302a),
      onInverseSurface: Color(0xffffffff),
      inversePrimary: Color(0xfffdeb8f),
      primaryFixed: Color(0xff4e4200),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff352c00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4a4226),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff332c12),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff284a33),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff12331e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded9d0),
      surfaceBright: Color(0xfffef9f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f3ea),
      surfaceContainer: Color(0xfff2ede4),
      surfaceContainerHigh: Color(0xffece7de),
      surfaceContainerHighest: Color(0xffe6e2d9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd8c66e),
      surfaceTint: Color(0xffd8c66e),
      onPrimary: Color(0xff373000),
      primaryContainer: Color(0xff524600),
      onPrimaryContainer: Color(0xfff5e287),
      secondary: Color(0xffd0c5a1),
      onSecondary: Color(0xff362f15),
      secondaryContainer: Color(0xff4e462a),
      onSecondaryContainer: Color(0xffede1bc),
      tertiary: Color(0xffa9d0b3),
      onTertiary: Color(0xff153723),
      tertiaryContainer: Color(0xff2c4e37),
      onTertiaryContainer: Color(0xffc5ecce),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff15130e),
      onSurface: Color(0xffe6e2d9),
      onSurfaceVariant: Color(0xffccc5b4),
      outline: Color(0xff959080),
      outlineVariant: Color(0xff4a4739),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e2d9),
      onInverseSurface: Color(0xff32302a),
      inversePrimary: Color(0xff6d5e0f),
      primaryFixed: Color(0xfff5e287),
      onPrimaryFixed: Color(0xff221b00),
      primaryFixedDim: Color(0xffd8c66e),
      onPrimaryFixedVariant: Color(0xff524600),
      secondaryFixed: Color(0xffede1bc),
      onSecondaryFixed: Color(0xff211b04),
      secondaryFixedDim: Color(0xffd0c5a1),
      onSecondaryFixedVariant: Color(0xff4e462a),
      tertiaryFixed: Color(0xffc5ecce),
      onTertiaryFixed: Color(0xff00210f),
      tertiaryFixedDim: Color(0xffa9d0b3),
      onTertiaryFixedVariant: Color(0xff2c4e37),
      surfaceDim: Color(0xff15130e),
      surfaceBright: Color(0xff3b3933),
      surfaceContainerLowest: Color(0xff0f0e09),
      surfaceContainerLow: Color(0xff1d1c16),
      surfaceContainer: Color(0xff21201a),
      surfaceContainerHigh: Color(0xff2c2a24),
      surfaceContainerHighest: Color(0xff37352f),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffdcca72),
      surfaceTint: Color(0xffd8c66e),
      onPrimary: Color(0xff1d1600),
      primaryContainer: Color(0xffa0903d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd4c9a5),
      onSecondary: Color(0xff1c1601),
      secondaryContainer: Color(0xff999070),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffadd4b7),
      onTertiary: Color(0xff001b0a),
      tertiaryContainer: Color(0xff749a7f),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff15130e),
      onSurface: Color(0xfffefaf1),
      onSurfaceVariant: Color(0xffd0c9b8),
      outline: Color(0xffa7a192),
      outlineVariant: Color(0xff878173),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e2d9),
      onInverseSurface: Color(0xff2d2b25),
      inversePrimary: Color(0xff544701),
      primaryFixed: Color(0xfff5e287),
      onPrimaryFixed: Color(0xff181100),
      primaryFixedDim: Color(0xffd8c66e),
      onPrimaryFixedVariant: Color(0xff403500),
      secondaryFixed: Color(0xffede1bc),
      onSecondaryFixed: Color(0xff161000),
      secondaryFixedDim: Color(0xffd0c5a1),
      onSecondaryFixedVariant: Color(0xff3d361c),
      tertiaryFixed: Color(0xffc5ecce),
      onTertiaryFixed: Color(0xff001606),
      tertiaryFixedDim: Color(0xffa9d0b3),
      onTertiaryFixedVariant: Color(0xff1c3d27),
      surfaceDim: Color(0xff15130e),
      surfaceBright: Color(0xff3b3933),
      surfaceContainerLowest: Color(0xff0f0e09),
      surfaceContainerLow: Color(0xff1d1c16),
      surfaceContainer: Color(0xff21201a),
      surfaceContainerHigh: Color(0xff2c2a24),
      surfaceContainerHighest: Color(0xff37352f),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffefbf2),
      surfaceTint: Color(0xffd8c66e),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffdcca72),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffefbf2),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd4c9a5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff1fff4),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffadd4b7),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff15130e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffefbf2),
      outline: Color(0xffd0c9b8),
      outlineVariant: Color(0xffd0c9b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e2d9),
      onInverseSurface: Color(0xff000000),
      inversePrimary: Color(0xff322900),
      primaryFixed: Color(0xfff9e78b),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffdcca72),
      onPrimaryFixedVariant: Color(0xff1d1600),
      secondaryFixed: Color(0xfff1e5c0),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd4c9a5),
      onSecondaryFixedVariant: Color(0xff1c1601),
      tertiaryFixed: Color(0xffc9f0d2),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffadd4b7),
      onTertiaryFixedVariant: Color(0xff001b0a),
      surfaceDim: Color(0xff15130e),
      surfaceBright: Color(0xff3b3933),
      surfaceContainerLowest: Color(0xff0f0e09),
      surfaceContainerLow: Color(0xff1d1c16),
      surfaceContainer: Color(0xff21201a),
      surfaceContainerHigh: Color(0xff2c2a24),
      surfaceContainerHighest: Color(0xff37352f),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
