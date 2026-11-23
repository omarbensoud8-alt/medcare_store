import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import 'home_page.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLanguage;

  const LoginPage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onToggleLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
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
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/logo.png',
                height: 110,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              Text(
                'welcome_back'.tr(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 6),
              Text('login_subtitle'.tr()),
              const SizedBox(height: 28),
              AppTextField(
                label: 'email'.tr(),
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'password'.tr(),
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {},
                  child: Text('forgot_password'.tr()),
                ),
              ),
              const SizedBox(height: 12),
              AppButton(
                text: 'login'.tr(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        isDarkMode: isDarkMode,
                        onToggleTheme: onToggleTheme,
                        onToggleLanguage: onToggleLanguage,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('no_account'.tr()),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(
                            isDarkMode: isDarkMode,
                            onToggleTheme: onToggleTheme,
                            onToggleLanguage: onToggleLanguage,
                          ),
                        ),
                      );
                    },
                    child: Text('sign_up'.tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}