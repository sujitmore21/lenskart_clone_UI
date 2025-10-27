import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/asset_helper.dart';
import '../../features/products/domain/models/product_model.dart';

/// Product Card Widget - Reusable product display card
class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavorite;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.onFavorite,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Product Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: SizedBox(
                    height: 130,
                    width: double.infinity,
                    child: Image.asset(
                      AssetHelper.getProductImage(product.imageUrl),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.surface,
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 48,
                            color: AppColors.textSecondary,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Discount Badge
                if (product.hasDiscount)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        product.discountPercentage ??
                            '${product.discountAmount.toStringAsFixed(0)} OFF',
                        style: AppTextStyles.labelSmall(
                          color: AppColors.textWhite,
                        ),
                      ),
                    ),
                  ),
                // Favorite Button
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    color: isFavorite ? AppColors.error : AppColors.textPrimary,
                    onPressed: onFavorite,
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                ),
              ],
            ),
            // Product Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Brand
                    Text(
                      product.brand,
                      style: AppTextStyles.caption(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    // Product Name
                    Flexible(
                      child: Text(
                        product.name,
                        style: AppTextStyles.titleMedium(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 3),
                    // Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: AppColors.accent,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${product.rating}',
                          style: AppTextStyles.labelSmall(),
                        ),
                        const SizedBox(width: 2),
                        Flexible(
                          child: Text(
                            '(${product.reviewCount})',
                            style: AppTextStyles.caption(
                              color: AppColors.textSecondary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    // Price
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            product.formattedPrice,
                            style: AppTextStyles.priceMedium(
                              color: AppColors.primary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (product.hasDiscount) ...[
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              product.formattedOriginalPrice,
                              style:
                                  AppTextStyles.bodySmall(
                                    color: AppColors.textSecondary,
                                  ).copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const Spacer(),
                    // Add to Cart Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: product.inStock ? onAddToCart : null,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          minimumSize: const Size(0, 36),
                        ),
                        child: Text(
                          product.inStock ? 'Add to Cart' : 'Out of Stock',
                          style: AppTextStyles.button(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
