import 'package:equatable/equatable.dart';

/// Product Domain Model
class ProductModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final String? discountPercentage;
  final String imageUrl;
  final List<String> imageUrls;
  final String category;
  final String brand;
  final double rating;
  final int reviewCount;
  final bool inStock;
  final int stockQuantity;
  final Map<String, dynamic>? specifications;
  final List<String>? availableColors;
  final List<String>? availableSizes;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    this.discountPercentage,
    required this.imageUrl,
    this.imageUrls = const [],
    required this.category,
    required this.brand,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.inStock = true,
    this.stockQuantity = 0,
    this.specifications,
    this.availableColors,
    this.availableSizes,
  });

  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  double get discountAmount => hasDiscount ? originalPrice! - price : 0.0;

  String get formattedPrice => '₹${price.toStringAsFixed(0)}';

  String get formattedOriginalPrice =>
      originalPrice != null ? '₹${originalPrice!.toStringAsFixed(0)}' : '';

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    price,
    originalPrice,
    imageUrl,
    category,
    brand,
    rating,
    inStock,
  ];

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? originalPrice,
    String? discountPercentage,
    String? imageUrl,
    List<String>? imageUrls,
    String? category,
    String? brand,
    double? rating,
    int? reviewCount,
    bool? inStock,
    int? stockQuantity,
    Map<String, dynamic>? specifications,
    List<String>? availableColors,
    List<String>? availableSizes,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      imageUrl: imageUrl ?? this.imageUrl,
      imageUrls: imageUrls ?? this.imageUrls,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      inStock: inStock ?? this.inStock,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      specifications: specifications ?? this.specifications,
      availableColors: availableColors ?? this.availableColors,
      availableSizes: availableSizes ?? this.availableSizes,
    );
  }
}
