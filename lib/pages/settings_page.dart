import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const SettingsPage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _darkModeValue;

  @override
  void initState() {
    super.initState();
    _darkModeValue = widget.isDarkMode;
  }

  @override
  void didUpdateWidget(covariant SettingsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _darkModeValue = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('dark_mode'.tr()),
              secondary: const Icon(Icons.dark_mode),
              value: _darkModeValue,
              onChanged: (value) {
                setState(() {
                  _darkModeValue = value;
                });
                widget.onToggleTheme();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text('language'.tr()),
              subtitle: Text(isArabic ? 'العربية' : 'English'),
              trailing: OutlinedButton(
                onPressed: () async {
                  if (isArabic) {
                    await context.setLocale(const Locale('en'));
                  } else {
                    await context.setLocale(const Locale('ar'));
                  }
                },
                child: Text(isArabic ? 'English' : 'العربية'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}