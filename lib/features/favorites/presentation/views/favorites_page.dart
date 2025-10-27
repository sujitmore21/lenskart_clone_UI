import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/product_card.dart';
import '../../../../features/cart/presentation/viewmodels/cart_viewmodel.dart';
import '../viewmodels/favorites_viewmodel.dart';

/// Favorites Page - Display favorite products
class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesViewModelProvider);
    final cartViewModel = ref.watch(cartViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        centerTitle: true,
        actions: [
          if (favoritesState.favorites.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Clear All Favorites'),
                    content: const Text(
                      'Are you sure you want to remove all favorites?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          ref
                              .read(favoritesViewModelProvider.notifier)
                              .clearFavorites();
                          Navigator.pop(context);
                        },
                        child: const Text('Clear All'),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      body: favoritesState.favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Favorites Yet',
                    style: AppTextStyles.headlineMedium(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start adding products to your favorites',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.shopping_bag),
                    label: const Text('Start Shopping'),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                // Future for refresh indicator
                await Future.delayed(const Duration(milliseconds: 500));
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.60,
                ),
                itemCount: favoritesState.favorites.length,
                itemBuilder: (context, index) {
                  final product = favoritesState.favorites[index];
                  final isFavorite = favoritesState.isFavorite(product.id);

                  return ProductCard(
                    product: product,
                    isFavorite: isFavorite,
                    onTap: () {
                      context.push('/product/${product.id}');
                    },
                    onAddToCart: () {
                      cartViewModel.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to cart'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    onFavorite: () {
                      ref
                          .read(favoritesViewModelProvider.notifier)
                          .toggleFavorite(product);
                    },
                  );
                },
              ),
            ),
    );
  }
}
