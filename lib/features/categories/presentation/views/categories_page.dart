import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_images.dart';

/// Categories Page - Display all product categories
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories'), centerTitle: true),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: AppConstants.categories.length,
        itemBuilder: (context, index) {
          final category = AppConstants.categories[index];
          final categoryImages = [
            AppImages.categoryEyeglasses,
            AppImages.categorySunglasses,
            AppImages.categoryContactLenses,
            AppImages.categoryEyeCare,
            AppImages.categoryAccessories,
          ];

          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () {
                context.push('/products?category=$category');
              },
              borderRadius: BorderRadius.circular(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      categoryImages[index],
                      width: 60,
                      height: 60,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.category,
                          size: 40,
                          color: AppColors.primary,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    category,
                    style: AppTextStyles.titleMedium(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      context.push('/products?category=$category');
                    },
                    child: const Text('Explore'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
