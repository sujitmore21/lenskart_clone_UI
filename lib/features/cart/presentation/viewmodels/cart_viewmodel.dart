import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/cart_item_model.dart';
import '../../../products/domain/models/product_model.dart';

/// Cart State
class CartState {
  final List<CartItemModel> items;
  final bool isLoading;

  CartState({this.items = const [], this.isLoading = false});

  double get totalAmount {
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  String get formattedTotalAmount => '₹${totalAmount.toStringAsFixed(0)}';

  CartState copyWith({List<CartItemModel>? items, bool? isLoading}) {
    return CartState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Cart ViewModel
class CartViewModel extends StateNotifier<CartState> {
  CartViewModel() : super(CartState());

  void addToCart(ProductModel product, {String? color, String? size}) {
    final existingItemIndex = state.items.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.selectedColor == color &&
          item.selectedSize == size,
    );

    if (existingItemIndex >= 0) {
      // Update quantity if item already exists
      final existingItem = state.items[existingItemIndex];
      final updatedItems = List<CartItemModel>.from(state.items);
      updatedItems[existingItemIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );
      state = state.copyWith(items: updatedItems);
    } else {
      // Add new item
      final newItem = CartItemModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        product: product,
        quantity: 1,
        selectedColor: color,
        selectedSize: size,
      );
      state = state.copyWith(items: [...state.items, newItem]);
    }
  }

  void removeFromCart(String itemId) {
    final updatedItems = state.items
        .where((item) => item.id != itemId)
        .toList();
    state = state.copyWith(items: updatedItems);
  }

  void updateQuantity(String itemId, int quantity) {
    if (quantity <= 0) {
      removeFromCart(itemId);
      return;
    }

    final updatedItems = state.items.map((item) {
      if (item.id == itemId) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();

    state = state.copyWith(items: updatedItems);
  }

  void clearCart() {
    state = state.copyWith(items: []);
  }

  bool isInCart(ProductModel product) {
    return state.items.any((item) => item.product.id == product.id);
  }
}

/// Cart ViewModel Provider
final cartViewModelProvider = StateNotifierProvider<CartViewModel, CartState>((
  ref,
) {
  return CartViewModel();
});
