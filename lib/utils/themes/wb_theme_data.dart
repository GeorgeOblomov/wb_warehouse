import 'package:flutter/material.dart';

class WbThemeData {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(background: Colors.white),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Color(0xFF3B3E5B)),
      selectedItemColor: Color(0xFF3B3E5B),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF4CAF50)),
    sliderTheme: SliderThemeData(
      trackHeight: 2,
      activeTrackColor: const Color(0xFF7C7E92),
      inactiveTrackColor: const Color(0xFF7C7E92),
      thumbColor: Colors.white,
      overlayShape: SliderComponentShape.noOverlay,
      rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 8, elevation: 5),
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
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF2E2E2E)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF2E2E2E),
      selectedIconTheme: IconThemeData(color: Colors.white),
      selectedItemColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF6ADA6F)),
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
