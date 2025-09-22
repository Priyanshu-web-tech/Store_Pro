import 'package:flutter/material.dart';

abstract class Styles {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff35693f),
    surfaceTint: Color(0xff35693f),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffb6f1ba),
    onPrimaryContainer: Color(0xff1c5129),
    secondary: Color(0xff006973),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xff9df0fc),
    onSecondaryContainer: Color(0xff004f57),
    tertiary: Color(0xff8c4a60),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffffd9e2),
    onTertiaryContainer: Color(0xff703349),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff93000a),
    surface: Color(0xfff7fbf2),
    onSurface: Color(0xff181d18),
    onSurfaceVariant: Color(0xff414941),
    outline: Color(0xff727970),
    outlineVariant: Color(0xffc1c9be),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2d322c),
    inversePrimary: Color(0xff9bd4a0),
    primaryFixed: Color(0xffb6f1ba),
    onPrimaryFixed: Color(0xff002109),
    primaryFixedDim: Color(0xff9bd4a0),
    onPrimaryFixedVariant: Color(0xff1c5129),
    secondaryFixed: Color(0xff9df0fc),
    onSecondaryFixed: Color(0xff001f23),
    secondaryFixedDim: Color(0xff81d3df),
    onSecondaryFixedVariant: Color(0xff004f57),
    tertiaryFixed: Color(0xffffd9e2),
    onTertiaryFixed: Color(0xff3a071d),
    tertiaryFixedDim: Color(0xffffb0c8),
    onTertiaryFixedVariant: Color(0xff703349),
    surfaceDim: Color(0xffd7dbd3),
    surfaceBright: Color(0xfff7fbf2),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff1f5ec),
    surfaceContainer: Color(0xffebefe7),
    surfaceContainerHigh: Color(0xffe5e9e1),
    surfaceContainerHighest: Color(0xffe0e4dc),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff9bd4a0),
    surfaceTint: Color(0xff9bd4a0),
    onPrimary: Color(0xff003915),
    primaryContainer: Color(0xff1c5129),
    onPrimaryContainer: Color(0xffb6f1ba),
    secondary: Color(0xff81d3df),
    onSecondary: Color(0xff00363c),
    secondaryContainer: Color(0xff004f57),
    onSecondaryContainer: Color(0xff9df0fc),
    tertiary: Color(0xffffb0c8),
    onTertiary: Color(0xff541d32),
    tertiaryContainer: Color(0xff703349),
    onTertiaryContainer: Color(0xffffd9e2),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff101510),
    onSurface: Color(0xffe0e4dc),
    onSurfaceVariant: Color(0xffc1c9be),
    outline: Color(0xff8b9389),
    outlineVariant: Color(0xff414941),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffe0e4dc),
    inversePrimary: Color(0xff35693f),
    primaryFixed: Color(0xffb6f1ba),
    onPrimaryFixed: Color(0xff002109),
    primaryFixedDim: Color(0xff9bd4a0),
    onPrimaryFixedVariant: Color(0xff1c5129),
    secondaryFixed: Color(0xff9df0fc),
    onSecondaryFixed: Color(0xff001f23),
    secondaryFixedDim: Color(0xff81d3df),
    onSecondaryFixedVariant: Color(0xff004f57),
    tertiaryFixed: Color(0xffffd9e2),
    onTertiaryFixed: Color(0xff3a071d),
    tertiaryFixedDim: Color(0xffffb0c8),
    onTertiaryFixedVariant: Color(0xff703349),
    surfaceDim: Color(0xff101510),
    surfaceBright: Color(0xff363a35),
    surfaceContainerLowest: Color(0xff0b0f0b),
    surfaceContainerLow: Color(0xff181d18),
    surfaceContainer: Color(0xff1c211c),
    surfaceContainerHigh: Color(0xff262b26),
    surfaceContainerHighest: Color(0xff313630),
  );

  static const TextStyle productRowItemName = TextStyle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal);

  static const TextStyle productRowTotal = TextStyle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal);

  static const TextStyle productRowItemPrice = TextStyle(
      color: Color(0xFF8E8E93), fontSize: 13, fontWeight: FontWeight.w300);

  static const TextStyle searchText = TextStyle(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal);

  static const TextStyle deliveryTimeLabel =
      TextStyle(color: Color(0xFFC2C2C2), fontWeight: FontWeight.w300);

  static const TextStyle deliveryTime = TextStyle(color: Colors.grey);
}
