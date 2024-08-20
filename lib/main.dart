import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'pages/welcome_page.dart';
import 'home/home_page.dart';
import 'settings/settings_page.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Supabase باستخدام URL والمفتاح العام الذي قدمته
  await Supabase.initialize(
    url: 'https://yhgmzwyzwontrjeurshc.supabase.co', // عنوان URL لمشروعك
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InloZ216d3l6d29udHJqZXVyc2hjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQxNzkwMjksImV4cCI6MjAzOTc1NTAyOX0.tnP7wCC40pVD_eEWY889tOblvzYK9gBD7ia7Jp9-BI4',
  );

  // تهيئة Sentry
  await SentryFlutter.init(
        (options) {
      options.dsn = 'YOUR_DSN_URL'; // ضع هنا DSN الخاص بـ Sentry إذا كان لديك
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
