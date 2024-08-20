import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as flutterProvider; // توجيه لمكتبة provider الخاصة بـ Flutter
import 'package:supabase_flutter/supabase_flutter.dart';
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
  List<dynamic> _contentData = []; // قائمة لتخزين البيانات

  static final List<Widget> _pages = <Widget>[
    EducationPage(),
    AdoptionPage(),
    const HomePageContent(),
    ProductsPage(),
    ClinicsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _fetchContent(); // جلب البيانات عند تهيئة الصفحة
  }

  Future<void> _fetchContent() async {
    final response = await Supabase.instance.client
        .from('your_table_name') // استبدل your_table_name باسم الجدول الخاص بك
        .select()
        .order('created_at', ascending: false)
        .execute();

    if (response.error == null && response.data != null) {
      setState(() {
        _contentData = response.data as List<dynamic>;
      });
    } else {
      // تجنب استخدام print في بيئة الإنتاج
      debugPrint('Error fetching data: ${response.error?.message}');
    }
  }

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
          IconButton(
            icon: const Icon(Icons.brightness_high_sharp),
            onPressed: () {
              flutterProvider.Provider.of<ThemeProvider>(context, listen: false).toggleDarkMode(
                  !flutterProvider.Provider.of<ThemeProvider>(context, listen: false).isDarkMode());
            },
          ),
        ],
      ),
      body: Center(
        child: _selectedIndex == 2
            ? _buildContentList() // عرض المحتوى إذا كانت الصفحة الرئيسية محددة
            : _pages.elementAt(_selectedIndex),
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
            icon: Icon(Icons.verified_user, size: 30),
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

  Widget _buildContentList() {
    if (_contentData.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: _contentData.length,
      itemBuilder: (context, index) {
        final item = _contentData[index];
        return ListTile(
          title: Text(item['title']), // افترض أن لديك عمود 'title' في جدولك
          subtitle: Text(item['description']), // افترض أن لديك عمود 'description'
        );
      },
    );
  }
}
