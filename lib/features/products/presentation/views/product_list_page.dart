import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../products/presentation/viewmodels/product_viewmodel.dart';
import '../../../../shared/widgets/product_card.dart';

/// Product List Page - Displays products by category or all products
class ProductListPage extends ConsumerStatefulWidget {
  final String category;

  const ProductListPage({super.key, this.category = ''});

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(productViewModelProvider.notifier)
          .loadProducts(
            category: widget.category.isNotEmpty ? widget.category : null,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.isNotEmpty ? widget.category : 'All Products',
        ),
      ),
      body: productState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : productState.error != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productState.error!,
                    style: AppTextStyles.bodyMedium(color: AppColors.error),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(productViewModelProvider.notifier)
                          .loadProducts(category: widget.category);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : productState.products.isEmpty
          ? Center(
              child: Text(
                'No products found',
                style: AppTextStyles.bodyLarge(color: AppColors.textSecondary),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.60,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: productState.products.length,
              itemBuilder: (context, index) {
                final product = productState.products[index];
                return ProductCard(
                  product: product,
                  onTap: () {
                    context.push('/product/${product.id}');
                  },
                  onAddToCart: () {
                    // Add to cart logic
                  },
                );
              },
            ),
    );
  }
}
