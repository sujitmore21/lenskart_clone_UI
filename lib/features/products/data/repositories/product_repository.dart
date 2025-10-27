import '../../domain/models/product_model.dart';
// import '../../../../shared/services/api_service.dart'; // Will be used for actual API calls

/// Product Repository - Handles data operations
class ProductRepository {
  // final ApiService _apiService = ApiService.instance; // Will be used for actual API calls

  // Fetch all products
  Future<List<ProductModel>> getProducts({
    String? category,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      // Mock data for now - replace with actual API call
      await Future.delayed(const Duration(milliseconds: 500));

      return _generateMockProducts(category: category);
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  // Fetch product by ID
  Future<ProductModel> getProductById(String id) async {
    try {
      // Mock data for now - replace with actual API call
      await Future.delayed(const Duration(milliseconds: 300));

      final products = _generateMockProducts();
      return products.firstWhere((p) => p.id == id);
    } catch (e) {
      throw Exception('Failed to fetch product: $e');
    }
  }

  // Search products
  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      final products = _generateMockProducts();
      return products
          .where(
            (p) =>
                p.name.toLowerCase().contains(query.toLowerCase()) ||
                p.brand.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to search products: $e');
    }
  }

  // Generate mock products for demo
  List<ProductModel> _generateMockProducts({String? category}) {
    final products = [
      ProductModel(
        id: '1',
        name: 'Classic Black Round Frame',
        description: 'Stylish round frame glasses perfect for everyday wear',
        price: 1999,
        originalPrice: 2999,
        discountPercentage: '33%',
        imageUrl: 'assets/images/product_1.png',
        imageUrls: [
          'assets/images/product_1.png',
          'assets/images/product_2.png',
        ],
        category: 'Eyeglasses',
        brand: 'Lenskart',
        rating: 4.5,
        reviewCount: 234,
        inStock: true,
        stockQuantity: 50,
        availableColors: ['Black', 'Brown', 'Blue'],
      ),
      ProductModel(
        id: '2',
        name: 'Aviator Sunglasses',
        description: 'Classic aviator style sunglasses with UV protection',
        price: 2999,
        originalPrice: 3999,
        discountPercentage: '25%',
        imageUrl: 'assets/images/product_2.png',
        category: 'Sunglasses',
        brand: 'Lenskart',
        rating: 4.7,
        reviewCount: 189,
        inStock: true,
        stockQuantity: 30,
        availableColors: ['Gold', 'Silver', 'Black'],
      ),
      ProductModel(
        id: '3',
        name: 'Modern Square Frame',
        description: 'Contemporary square frame design for a bold look',
        price: 2499,
        imageUrl: 'assets/images/product_3.png',
        category: 'Eyeglasses',
        brand: 'Lenskart',
        rating: 4.3,
        reviewCount: 156,
        inStock: true,
        stockQuantity: 40,
        availableColors: ['Black', 'Grey', 'Tortoise'],
      ),
      ProductModel(
        id: '4',
        name: 'Wayfarer Sunglasses',
        description: 'Timeless wayfarer design with polarized lenses',
        price: 3499,
        originalPrice: 4499,
        discountPercentage: '22%',
        imageUrl: 'assets/images/product_4.png',
        category: 'Sunglasses',
        brand: 'Lenskart',
        rating: 4.8,
        reviewCount: 312,
        inStock: true,
        stockQuantity: 25,
        availableColors: ['Black', 'Brown', 'Tortoise'],
      ),
      ProductModel(
        id: '5',
        name: 'Premium Contact Lenses Pack',
        description: 'Comfortable daily wear contact lenses (30 pack)',
        price: 999,
        imageUrl: 'assets/images/product_5.png',
        category: 'Contact Lenses',
        brand: 'Lenskart',
        rating: 4.6,
        reviewCount: 445,
        inStock: true,
        stockQuantity: 100,
        availableSizes: ['14.0mm', '14.2mm', '14.5mm'],
      ),
    ];

    if (category != null && category.isNotEmpty) {
      return products.where((p) => p.category == category).toList();
    }

    return products;
  }
}
