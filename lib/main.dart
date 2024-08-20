import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // إضافة مكتبة Supabase
import 'pages/welcome_page.dart';
import 'home/home_page.dart';
import 'settings/settings_page.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Supabase
  await Supabase.initialize(
    url: 'https://your-supabase-url.supabase.co', // ضع هنا رابط مشروع Supabase الخاص بك
    anonKey: 'your-anon-key', // ضع هنا المفتاح العام (anonKey) لمشروع Supabase
  );

  // تهيئة Sentry
  await SentryFlutter.init(
        (options) {
      options.dsn = 'YOUR_DSN_URL'; // ضع هنا DSN الخاص بـ Sentry
    },
    appRunner: () => runApp(MyApp()),
  );

  // معالجة الأخطاء غير المعالجة
  FlutterError.onError = (FlutterErrorDetails details) async {
    FlutterError.presentError(details);
    await Sentry.captureException(
      details.exception,
      stackTrace: details.stack,
    );
  };
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'تطبيق القطط',
            theme: themeProvider.getTheme(),
            initialRoute: '/',
            routes: {
              '/': (context) => WelcomePage(),
              '/home': (context) => const HomePage(),
              '/settings': (context) => SettingsPage(),
            },
          );
        },
      ),
    );
  }
}
