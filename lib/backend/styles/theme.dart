import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color(0xFFfbab66);
  static const Color loginGradientEnd = Color(0xFFAC5859);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkRed = Color(0xFFAC5859);
  static const Color lightGrey = Color(0xFFC7C9D9);
  static const Color darkMode = Color(0xFF343131);
  static const Color snowWhite = Color(0xFFFAFAFC);
  static const Color cremeColor = Color(0xFFD0A79C);
  static const Color guelden = Color(0xFFFEC89A);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static BoxDecoration getBackgroundGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[loginGradientStart, loginGradientEnd],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 1.0),
        stops: <double>[0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    );
  }

  static ThemeData getAppTheme() {
    return ThemeData.light().copyWith(
      primaryColor: darkRed,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
