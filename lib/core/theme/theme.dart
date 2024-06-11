import 'package:chat_using_websocket/core/theme/app_color_pallettes.dart';
import 'package:chat_using_websocket/core/theme/extension/app_typography_extension.dart';
import 'package:flutter/material.dart';

final themeData = ThemeData(extensions: [
  AppTypographyExtension(
    body: const TextStyle(
        fontSize: 14,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w500),
    bodyWhite: const TextStyle(
        fontSize: 14,
        fontFamily: 'poppins',
        color: AppColorPalettes.white500,
        fontWeight: FontWeight.w500),
    bodyLarge: const TextStyle(
        fontSize: 18,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w500),
    bodySemibold: const TextStyle(
        fontSize: 14,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w600),
    bodyLargeSemiBold: const TextStyle(
        fontSize: 18,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w600),
    bodySmall: const TextStyle(
        fontSize: 10,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w500),
    bodySmallSemiBold: const TextStyle(
        fontSize: 10,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w600),
    h1: const TextStyle(
        fontSize: 32,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w500),
    h1SemiBold: const TextStyle(
        fontSize: 32,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w600),
    h1Bold: const TextStyle(
        fontSize: 32,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w700),
    h2: const TextStyle(
        fontSize: 24,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w500),
    h2SemiBold: const TextStyle(
        fontSize: 24,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w600),
    h2Bold: const TextStyle(
        fontSize: 24,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w700),
    h3: const TextStyle(
        fontSize: 20,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w500),
    h3SemiBold: const TextStyle(
        fontSize: 20,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w600),
    h3Bold: const TextStyle(
        fontSize: 20,
        fontFamily: 'poppins',
        color: AppColorPalettes.black500,
        fontWeight: FontWeight.w700),
    buttonText: const TextStyle(
      fontSize: 14,
      fontFamily: 'poppins',
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w600,
    ),
  ),
]);
