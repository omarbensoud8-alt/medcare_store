import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import 'home_page.dart';

class SignUpPage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLanguage;

  const SignUpPage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onToggleLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign_up'.tr()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              AppTextField(
                label: 'full_name'.tr(),
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 24),
              AppButton(
                text: 'create_account'.tr(),
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
            ],
          ),
        ),
      ),
    );
  }
}