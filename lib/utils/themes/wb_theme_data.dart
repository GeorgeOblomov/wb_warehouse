import 'package:flutter/material.dart';

class WbThemeData {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(background: Colors.white),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF5F5F5),
      iconTheme: IconThemeData(
        color: Color(0xFF3B3E5B),
      ),
      titleTextStyle: TextStyle(
        color: Color(0xFF3B3E5B),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Color(0xFF3B3E5B)),
      selectedItemColor: Color(0xFF3B3E5B),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF4CAF50)),
    checkboxTheme: CheckboxThemeData(fillColor: MaterialStateColor.resolveWith((_) => const Color(0xFF4CAF50))),
    sliderTheme: SliderThemeData(
      trackHeight: 2,
      activeTrackColor: const Color(0xFF7C7E92),
      inactiveTrackColor: const Color(0xFF7C7E92),
      thumbColor: Colors.white,
      overlayShape: SliderComponentShape.noOverlay,
      rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 8, elevation: 5),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFFF5F5F5),
      contentTextStyle: TextStyle(color: Color(0xFF3B3E5B)),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: const Color(0xFF3B3E5B),
        borderRadius: BorderRadius.circular(40),
      ),
      labelColor: Colors.white,
      unselectedLabelColor: const Color(0xFF7C7E92),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(background: Color(0xFF2E2E2E)),
    primaryColor: const Color(0xFF2E2E2E),
    scaffoldBackgroundColor: const Color(0xFF2E2E2E),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2E2E2E),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF2E2E2E),
      selectedIconTheme: IconThemeData(color: Colors.white),
      selectedItemColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF6ADA6F)),
    checkboxTheme: CheckboxThemeData(fillColor: MaterialStateColor.resolveWith((_) => const Color(0xFF4CAF50))),
    sliderTheme: SliderThemeData(
      trackHeight: 2,
      activeTrackColor: const Color(0xFF4CAF50),
      inactiveTrackColor: const Color(0xFF7C7E92),
      thumbColor: Colors.white,
      overlayShape: SliderComponentShape.noOverlay,
      rangeThumbShape: const RoundRangeSliderThumbShape(
        enabledThumbRadius: 8,
        elevation: 5,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF2E2E32),
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: const Color(0xFF3B3E5B),
        borderRadius: BorderRadius.circular(40),
      ),
      labelColor: Colors.white,
      unselectedLabelColor: const Color(0xFF3B3E5B),
    ),
  );
}
