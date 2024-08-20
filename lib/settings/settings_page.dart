import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color currentColor = themeProvider.getBottomNavBarColor();
    final BottomNavigationBarType currentType = themeProvider.getBottomNavBarType();
    final bool isDarkMode = themeProvider.isDarkMode();

    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
        backgroundColor: currentColor, // استخدام اللون المحدد للشريط السفلي
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // تغيير لون الشريط السفلي
            ListTile(
              title: const Text('لون الشريط السفلي'),
              trailing: DropdownButton<Color>(
                value: currentColor,
                onChanged: (Color? newColor) {
                  if (newColor != null) {
                    themeProvider.setBottomNavBarColor(newColor);
                  }
                },
                items: <Color>[Colors.teal, Colors.blue, Colors.green]
                    .map<DropdownMenuItem<Color>>((Color value) {
                  return DropdownMenuItem<Color>(
                    value: value,
                    child: Container(
                      width: 24,
                      height: 24,
                      color: value,
                    ),
                  );
                }).toList(),
              ),
            ),
            // تغيير نوع الشريط السفلي
            ListTile(
              title: const Text('نوع الشريط السفلي'),
              trailing: DropdownButton<BottomNavigationBarType>(
                value: currentType,
                onChanged: (BottomNavigationBarType? newType) {
                  if (newType != null) {
                    themeProvider.setBottomNavBarType(newType);
                  }
                },
                items: <BottomNavigationBarType>[
                  BottomNavigationBarType.fixed,
                  BottomNavigationBarType.shifting
                ].map<DropdownMenuItem<BottomNavigationBarType>>(
                        (BottomNavigationBarType value) {
                      return DropdownMenuItem<BottomNavigationBarType>(
                        value: value,
                        child: Text(value == BottomNavigationBarType.fixed
                            ? 'Fixed'
                            : 'Shifting'),
                      );
                    }).toList(),
              ),
            ),
            // تفعيل/تعطيل الوضع الليلي
            SwitchListTile(
              title: const Text('الوضع الليلي'),
              value: isDarkMode,
              onChanged: (bool value) {
                themeProvider.toggleDarkMode(value);
              },
              secondary: const Icon(Icons.dark_mode),
            ),
          ],
        ),
      ),
    );
  }
}
