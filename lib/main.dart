import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MedCareApp(),
    ),
  );
}

class MedCareApp extends StatefulWidget {
  const MedCareApp({super.key});

  @override
  State<MedCareApp> createState() => _MedCareAppState();
}

class _MedCareAppState extends State<MedCareApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _toggleLanguage(BuildContext context) {
    if (context.locale.languageCode == 'ar') {
      context.setLocale(const Locale('en'));
    } else {
      context.setLocale(const Locale('ar'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00796B),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF00796B),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00796B),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF26A69A),
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF26A69A),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
      ),
      home: SplashPage(
        isDarkMode: _isDarkMode,
        onToggleTheme: _toggleTheme,
        onToggleLanguage: () => _toggleLanguage(context),
      ),
    );
  }
}