import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/views/splash_screen.dart';
import '../../features/auth/presentation/views/login_page.dart';
import '../../features/auth/presentation/views/signup_page.dart';
import '../../features/auth/domain/providers/auth_provider.dart';
import '../../features/home/presentation/views/main_navigation_page.dart';
import '../../features/products/presentation/views/product_list_page.dart';
import '../../features/products/presentation/views/product_detail_page.dart';
import '../../features/cart/presentation/views/cart_page.dart';

/// App Router Configuration using GoRouter
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      final isAuthenticated = authState.isAuthenticated;
      final isGoingToAuth =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup';
      final isGoingToSplash = state.matchedLocation == '/splash';

      // If authenticated and trying to access auth pages, redirect to home
      if (isAuthenticated && isGoingToAuth && !isGoingToSplash) {
        return '/home';
      }

      // If not authenticated and trying to access protected pages, redirect to login
      if (!isAuthenticated && !isGoingToAuth && !isGoingToSplash) {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignupPage(),
      ),
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
});
