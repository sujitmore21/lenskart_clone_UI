import 'package:flutter/services.dart';

/// Helper class for managing assets dynamically
class AssetHelper {
  AssetHelper._();

  /// Get image path dynamically based on category or type
  static String getCategoryImage(String category) {
    switch (category.toLowerCase()) {
      case 'eyeglasses':
        return 'assets/images/category_eyeglasses.png';
      case 'sunglasses':
        return 'assets/images/category_sunglasses.png';
      case 'contact lenses':
        return 'assets/images/category_contact_lenses.png';
      case 'eye care':
        return 'assets/images/category_eye_care.png';
      case 'accessories':
        return 'assets/images/category_accessories.png';
      default:
        return 'assets/images/placeholder.png';
    }
  }

  /// Get product image with fallback
  static String getProductImage(String? imageUrl, {int? index}) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return imageUrl;
    }

    // Use placeholder or indexed placeholder
    if (index != null) {
      final productImages = [
        'assets/images/product_1.png',
        'assets/images/product_2.png',
        'assets/images/product_3.png',
        'assets/images/product_4.png',
        'assets/images/product_5.png',
      ];
      return productImages[index % productImages.length];
    }

    return 'assets/images/placeholder_product.png';
  }

  /// Get banner image dynamically
  static String getBannerImage(int index) {
    final banners = [
      'assets/images/banner_1.png',
      'assets/images/banner_2.png',
      'assets/images/banner_3.png',
    ];
    return banners[index % banners.length];
  }

  /// Load asset as bytes (useful for advanced image handling)
  static Future<Uint8List> loadAssetBytes(String path) async {
    final byteData = await rootBundle.load(path);
    return byteData.buffer.asUint8List();
  }
}
