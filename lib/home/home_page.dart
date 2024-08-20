import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_content.dart';
import '../theme.dart';
import '../settings/settings_page.dart';
import '../education/education_page.dart';
import '../adoption/adoption_page.dart';
import '../products/products_page.dart';
import '../clinics/clinics_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;

  static final List<Widget> _pages = <Widget>[
    EducationPage(),
    AdoptionPage(),
    const HomePageContent(),
    ProductsPage(),
    ClinicsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mew'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_on_sharp),
            onPressed: () {
              // تفعيل الإشعارات
            },
          ),
          // زر الوضع الليلي
          IconButton(
            icon: const Icon(Icons.brightness_high_sharp), // يمكن تغيير الأيقونة إذا كنت تستخدم أيقونة أخرى
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleDarkMode(
                  !Provider.of<ThemeProvider>(context, listen: false).isDarkMode());
            },
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school, size: 36),
            label: 'التعليم',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets, size: 30),
            label: 'التبني',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 30),
            label: 'المنتجات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user, size: 30), // تغيير الأيقونة
            label: 'العيادات',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;
  const PlaceholderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
