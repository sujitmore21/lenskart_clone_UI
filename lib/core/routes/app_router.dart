import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/main_navigation_page.dart';
import '../../features/products/presentation/views/product_list_page.dart';
import '../../features/products/presentation/views/product_detail_page.dart';
import '../../features/cart/presentation/views/cart_page.dart';

/// App Router Configuration using GoRouter
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const MainNavigationPage(),
      ),
      GoRoute(
        path: '/products',
        name: 'products',
        builder: (context, state) {
          final category = state.uri.queryParameters['category'] ?? '';
          return ProductListPage(category: category);
        },
      ),
      GoRoute(
        path: '/product/:id',
        name: 'product-detail',
        builder: (context, state) {
          final productId = state.pathParameters['id'] ?? '';
          return ProductDetailPage(productId: productId);
        },
      ),
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) => const CartPage(),
      ),
    ],
  );
}
