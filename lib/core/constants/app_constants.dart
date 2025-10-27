/// App-wide constants
class AppConstants {
  AppConstants._();

  // API Configuration
  static const String baseUrl = 'https://api.lenskart-clone.com';
  static const String apiVersion = '/v1';
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Storage Keys
  static const String keyAuthToken = 'auth_token';
  static const String keyUserId = 'user_id';
  static const String keyCartItems = 'cart_items';
  static const String keyFavorites = 'favorites';
  static const String keyUserPreferences = 'user_preferences';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Image Configuration
  static const String imageBaseUrl = 'https://static.lenskart-clone.com';
  static const String placeholderImage = 'assets/images/placeholder.png';

  // Animations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration shortAnimationDuration = Duration(milliseconds: 150);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // Sizes
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;
  static const double defaultElevation = 2.0;

  // Product Categories
  static const List<String> categories = [
    'Eyeglasses',
    'Sunglasses',
    'Contact Lenses',
    'Eye Care',
    'Accessories',
  ];

  // Error Messages
  static const String errorNetwork =
      'Network error. Please check your connection.';
  static const String errorGeneric = 'Something went wrong. Please try again.';
  static const String errorNotFound = 'Item not found.';
  static const String errorUnauthorized = 'Please login to continue.';
}
