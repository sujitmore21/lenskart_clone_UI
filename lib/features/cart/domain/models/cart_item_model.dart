import 'package:equatable/equatable.dart';
import '../../../products/domain/models/product_model.dart';

/// Cart Item Model
class CartItemModel extends Equatable {
  final String id;
  final ProductModel product;
  final int quantity;
  final String? selectedColor;
  final String? selectedSize;

  const CartItemModel({
    required this.id,
    required this.product,
    this.quantity = 1,
    this.selectedColor,
    this.selectedSize,
  });

  double get totalPrice => product.price * quantity;

  String get formattedTotalPrice => '₹${totalPrice.toStringAsFixed(0)}';

  @override
  List<Object?> get props => [
    id,
    product,
    quantity,
    selectedColor,
    selectedSize,
  ];

  CartItemModel copyWith({
    String? id,
    ProductModel? product,
    int? quantity,
    String? selectedColor,
    String? selectedSize,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }
}
