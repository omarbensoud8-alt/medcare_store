import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'onboarding_page.dart';

class SplashPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLanguage;

  const SplashPage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onToggleLanguage,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingPage(
            isDarkMode: widget.isDarkMode,
            onToggleTheme: widget.onToggleTheme,
            onToggleLanguage: widget.onToggleLanguage,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 140,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
            Text(
              'app_name'.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}