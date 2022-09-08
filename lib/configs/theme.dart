import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: const Color(0xFFFF4200),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    fontFamily: 'AppleSDGothicNeo',
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xFF111111),
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        color: Color(0xFF111111),
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headline3: TextStyle(
        color: Color(0xFF111111),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      headline4: TextStyle(
        color: Color(0xFF111111),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline5: TextStyle(
        color: Color(0xFF111111),
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      headline6: TextStyle(
        color: Color(0xFF111111),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: TextStyle(
        color: Color(0xFF111111),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF111111),
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFFFFFFF),
      elevation: 0,
    ),
    colorScheme: const ColorScheme(
      primary: Color(0xFFFF4200),
      secondary: Color(0xFFB32E00),
      background: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      error: Color(0x00000000),
      brightness: Brightness.light,
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      onError: Color(0xFF2b2e4a),
      onBackground: Color(0xFF2b2e4a),
      onSurface: Color(0xFF2b2e4a),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
    ),
    errorColor: const Color(0xFFFF4200),
    iconTheme: const IconThemeData(color: Color(0xFF000000)),
    bottomAppBarColor: const Color(0xFF424242),
    cardTheme: CardTheme(
      color: const Color(0xFFFFFFFF),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
      elevation: 6,
    ),
  );
}
