import 'package:flutter/material.dart';

import 'colors_theme_const.dart';

class DefaultTheme {
  static get light => ThemeData(
        primaryColor: themeColor,
        primarySwatch: Colors.purple,
        cardColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xffF2F2F2),
        // appBarTheme: const AppBarTheme(
        //     backgroundColor: themeYellow,
        //     elevation: 0,
        //     foregroundColor: Colors.white,
        //     scrolledUnderElevation: 10),
        textTheme: TextTheme(
            bodyLarge: textLarge,
            bodyMedium: textMedium,
            bodySmall: textSmall,
            displayMedium: textMedium,
            titleLarge: const TextStyle(
                color: colorText, fontSize: 32, fontWeight: FontWeight.bold)),
        focusColor: themeColor.withOpacity(0.3),
        splashColor: themeColor.withOpacity(0.4),
        hoverColor: themeColor.withOpacity(0.3),
      );
}
