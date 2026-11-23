import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String name;
  final String price;
  final String description;
  final String imagePath;

  const ProductDetailsPage({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 220,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Text(
                '$price ${'currency'.tr()}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}