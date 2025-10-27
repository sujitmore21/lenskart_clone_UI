import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/asset_helper.dart';
import '../../domain/models/product_model.dart';
import '../../data/repositories/product_repository.dart';
import '../../../cart/presentation/viewmodels/cart_viewmodel.dart';

/// Product Detail Page - Shows detailed product information
class ProductDetailPage extends ConsumerStatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  ProductModel? product;
  bool isLoading = true;
  String? error;
  int selectedImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    try {
      final repository = ProductRepository();
      final loadedProduct = await repository.getProductById(widget.productId);
      setState(() {
        product = loadedProduct;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (error != null || product == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            error ?? 'Product not found',
            style: AppTextStyles.bodyMedium(color: AppColors.error),
          ),
        ),
      );
    }

    final p = product!;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Images
            SizedBox(
              height: 400,
              child: PageView.builder(
                itemCount: p.imageUrls.isNotEmpty ? p.imageUrls.length : 1,
                onPageChanged: (index) {
                  setState(() {
                    selectedImageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final imageUrl = p.imageUrls.isNotEmpty
                      ? p.imageUrls[index]
                      : p.imageUrl;
                  return Image.asset(
                    AssetHelper.getProductImage(imageUrl),
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.surface,
                        child: const Icon(Icons.image_not_supported, size: 64),
                      );
                    },
                  );
                },
              ),
            ),
            // Product Info
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand
                  Text(
                    p.brand,
                    style: AppTextStyles.caption(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Product Name
                  Text(p.name, style: AppTextStyles.headlineMedium()),
                  const SizedBox(height: 8),
                  // Rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.accent, size: 20),
                      const SizedBox(width: 4),
                      Text('${p.rating}', style: AppTextStyles.bodyMedium()),
                      const SizedBox(width: 8),
                      Text(
                        '(${p.reviewCount} reviews)',
                        style: AppTextStyles.bodySmall(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Price
                  Row(
                    children: [
                      Text(
                        p.formattedPrice,
                        style: AppTextStyles.priceLarge(
                          color: AppColors.primary,
                        ),
                      ),
                      if (p.hasDiscount) ...[
                        const SizedBox(width: 12),
                        Text(
                          p.formattedOriginalPrice,
                          style: AppTextStyles.bodyLarge(
                            color: AppColors.textSecondary,
                          ).copyWith(decoration: TextDecoration.lineThrough),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            p.discountPercentage ??
                                '${p.discountAmount.toStringAsFixed(0)} OFF',
                            style: AppTextStyles.discount(),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Description
                  Text('Description', style: AppTextStyles.titleMedium()),
                  const SizedBox(height: 8),
                  Text(p.description, style: AppTextStyles.bodyMedium()),
                  const SizedBox(height: 24),
                  // Specifications
                  if (p.specifications != null) ...[
                    Text('Specifications', style: AppTextStyles.titleMedium()),
                    const SizedBox(height: 8),
                    ...p.specifications!.entries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              entry.key,
                              style: AppTextStyles.bodyMedium(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            Text(
                              entry.value.toString(),
                              style: AppTextStyles.bodyMedium(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: AppColors.border,
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  // Add to favorites
                },
                child: const Icon(Icons.favorite_border),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: p.inStock
                    ? () {
                        ref.read(cartViewModelProvider.notifier).addToCart(p);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart')),
                        );
                      }
                    : null,
                child: Text(
                  p.inStock ? 'Add to Cart' : 'Out of Stock',
                  style: AppTextStyles.button(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
