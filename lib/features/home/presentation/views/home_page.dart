import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../products/presentation/viewmodels/product_viewmodel.dart';
import '../../../cart/presentation/viewmodels/cart_viewmodel.dart';
import '../../../favorites/presentation/viewmodels/favorites_viewmodel.dart';
import '../../../../shared/widgets/product_card.dart';

/// Home Page - Main landing page
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final PageController _bannerPageController = PageController();
  int _currentBannerIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productViewModelProvider.notifier).loadProducts();
    });
  }

  @override
  void dispose() {
    _bannerPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              AppImages.logoIcon,
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.shopping_bag_outlined);
              },
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () => context.push('/cart'),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final cartState = ref.watch(cartViewModelProvider);
                  if (cartState.totalItems > 0) {
                    return Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.error,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cartState.totalItems}',
                          style: AppTextStyles.labelSmall(
                            color: AppColors.textWhite,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(productViewModelProvider.notifier).loadProducts();
        },
        child: CustomScrollView(
          slivers: [
            // Banner Section
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: _bannerPageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentBannerIndex = index;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final banners = [
                          AppImages.banner1,
                          AppImages.banner2,
                          AppImages.banner3,
                        ];
                        return Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              banners[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: AppColors.primaryGradient,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Special Offer ${index + 1}',
                                      style: AppTextStyles.headlineLarge(
                                        color: AppColors.textWhite,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Page Indicator
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentBannerIndex == index
                                ? AppColors.primary
                                : AppColors.textSecondary.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Categories Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop by Category',
                      style: AppTextStyles.headlineMedium(),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final categories = [
                            'Eyeglasses',
                            'Sunglasses',
                            'Contact Lenses',
                            'Eye Care',
                            'Accessories',
                          ];
                          final categoryImages = [
                            AppImages.categoryEyeglasses,
                            AppImages.categorySunglasses,
                            AppImages.categoryContactLenses,
                            AppImages.categoryEyeCare,
                            AppImages.categoryAccessories,
                          ];
                          final category = categories[index];
                          final categoryImage = categoryImages[index];
                          return GestureDetector(
                            onTap: () {
                              context.push('/products?category=$category');
                            },
                            child: Container(
                              width: 100,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.border),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    categoryImage,
                                    width: 40,
                                    height: 40,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        Icons.face_retouching_natural,
                                        size: 40,
                                        color: AppColors.primary,
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    child: Text(
                                      category,
                                      style: AppTextStyles.labelMedium(),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Products Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Products',
                      style: AppTextStyles.headlineMedium(),
                    ),
                    TextButton(
                      onPressed: () => context.push('/products'),
                      child: const Text('View All'),
                    ),
                  ],
                ),
              ),
            ),
            // Products Grid
            if (productState.isLoading)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (productState.error != null)
              SliverFillRemaining(
                child: Center(
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
                              .loadProducts();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.60,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = productState.products[index];
                      final favoritesState = ref.watch(
                        favoritesViewModelProvider,
                      );
                      final isFavorite = favoritesState.isFavorite(product.id);

                      return ProductCard(
                        product: product,
                        isFavorite: isFavorite,
                        onTap: () {
                          context.push('/product/${product.id}');
                        },
                        onAddToCart: () {
                          ref
                              .read(cartViewModelProvider.notifier)
                              .addToCart(product);
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
                    childCount: productState.products.length > 4
                        ? 4
                        : productState.products.length,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
