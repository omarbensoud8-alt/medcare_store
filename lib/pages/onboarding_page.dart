import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'login_page.dart';

class OnboardingPage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLanguage;

  const OnboardingPage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onToggleLanguage,
  });

  void _goToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          isDarkMode: isDarkMode,
          onToggleTheme: onToggleTheme,
          onToggleLanguage: onToggleLanguage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: isArabic ? 'تغيير اللغة' : 'Change Language',
                    icon: const Icon(Icons.language),
                    onPressed: onToggleLanguage,
                  ),
                  IconButton(
                    tooltip: isDarkMode ? 'Light Mode' : 'Dark Mode',
                    icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                    onPressed: onToggleTheme,
                  ),
                ],
              ),
            ),
            Expanded(
              child: IntroductionScreen(
                pages: [
                  PageViewModel(
                    title: 'onboard_title_1'.tr(),
                    body: 'onboard_desc_1'.tr(),
                    image: Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 140,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  PageViewModel(
                    title: 'onboard_title_2'.tr(),
                    body: 'onboard_desc_2'.tr(),
                    image: Center(
                      child: Image.asset(
                        'assets/images/bp_monitor.png',
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  PageViewModel(
                    title: 'onboard_title_3'.tr(),
                    body: 'onboard_desc_3'.tr(),
                    image: Center(
                      child: Image.asset(
                        'assets/images/oximeter.png',
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
                showSkipButton: true,
                skip: Text('skip'.tr()),
                next: Text('next'.tr()),
                done: Text('done'.tr()),
                onSkip: () => _goToLogin(context),
                onDone: () => _goToLogin(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}