import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;
  bool _isDarkMode;
  Color _bottomNavBarColor;
  BottomNavigationBarType _bottomNavBarType;

  ThemeProvider()
      : _themeData = ThemeData(
    primaryColor: const Color(0xFF014E47), // الأخضر الداكن المحدد
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.white,
      primary: const Color(0xFF013A35), // الأخضر الداكن
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: const Color(0xFF014E47), // الأخضر الداكن
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF014E47), // الأخضر الداكن
        foregroundColor: Colors.white, // اللون الأبيض للنص
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF014E47), // الأخضر الداكن
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),
  ),
        _isDarkMode = false,
        _bottomNavBarColor = const Color(0xFF014E47),
        _bottomNavBarType = BottomNavigationBarType.fixed;

  ThemeData getTheme() => _themeData;
  bool isDarkMode() => _isDarkMode;
  Color getBottomNavBarColor() => _bottomNavBarColor;
  BottomNavigationBarType getBottomNavBarType() => _bottomNavBarType;

  void setBottomNavBarColor(Color color) {
    _bottomNavBarColor = color;
    notifyListeners();
  }

  void setBottomNavBarType(BottomNavigationBarType type) {
    _bottomNavBarType = type;
    notifyListeners();
  }

  void toggleDarkMode(bool isDark) {
    _isDarkMode = isDark;
    _themeData = isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  void toggleTheme() {}
}
