import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'product_details_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLanguage;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onToggleLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    final products = [
      {
        'name': isArabic ? 'جهاز قياس ضغط الدم' : 'Blood Pressure Monitor',
        'price': '180',
        'image': 'assets/images/bp_monitor.png',
        'description': isArabic
            ? 'جهاز رقمي دقيق لقياس ضغط الدم ومعدل النبض من الذراع مع شاشة كبيرة وواضحة.'
            : 'Accurate digital upper-arm blood pressure and pulse monitor with a clear display.',
      },
      {
        'name': isArabic ? 'مقياس أكسجين الدم' : 'Pulse Oximeter',
        'price': '65',
        'image': 'assets/images/oximeter.png',
        'description': isArabic
            ? 'جهاز سريع لقياس نسبة تشبع الأكسجين في الدم ومعدل نبضات القلب عبر الإصبع.'
            : 'Fast fingertip sensor for measuring blood oxygen saturation and heart rate.',
      },
      {
        'name': isArabic ? 'ميزان حرارة رقمي' : 'Digital Thermometer',
        'price': '35',
        'image': 'assets/images/thermometer.png',
        'description': isArabic
            ? 'ميزان حرارة طبي سريع القراءة مع تنبيه صوتي ودقة عالية للاستخدام المنزلي.'
            : 'Fast-reading medical thermometer with beep alert and high accuracy for home care.',
      },
      {
        'name': isArabic ? 'سماعة طبية' : 'Clinical Stethoscope',
        'price': '120',
        'image': 'assets/images/stethoscope.png',
        'description': isArabic
            ? 'سماعة طبية خفيفة الوزن بنقل صوتي واضح ومريح للفحوصات اليومية.'
            : 'Lightweight stethoscope with clear acoustic sound for daily clinical checks.',
      },
      {
        'name': isArabic ? 'جهاز استنشاق البخار' : 'Portable Nebulizer',
        'price': '150',
        'image': 'assets/images/nebulizer.png',
        'description': isArabic
            ? 'جهاز بخار عملي لتوصيل الرذاذ الطبي بفعالية وهدوء للعناية التنفسية.'
            : 'Compact nebulizer machine for quiet, effective respiratory aerosol therapy.',
      },
      {
        'name': isArabic ? 'جهاز قياس السكر' : 'Blood Glucose Meter',
        'price': '95',
        'image': 'assets/images/glucometer.png',
        'description': isArabic
            ? 'جهاز رقمي لقياس مستوى سكر الدم بسرعة وسهولة مع شاشة واضحة.'
            : 'Digital blood glucose monitor for quick, easy readings with a clear screen.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('home_title'.tr()),
        actions: [
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
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    isDarkMode: isDarkMode,
                    onToggleTheme: onToggleTheme,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.82,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      name: product['name'] as String,
                      price: product['price'] as String,
                      description: product['description'] as String,
                      imagePath: product['image'] as String,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          product['image'] as String,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product['name'] as String,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text('${product['price']} ${'currency'.tr()}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}