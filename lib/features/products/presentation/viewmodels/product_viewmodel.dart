import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/product_model.dart';
import '../../data/repositories/product_repository.dart';

/// Product ViewModel State
class ProductState {
  final List<ProductModel> products;
  final bool isLoading;
  final String? error;
  final String? selectedCategory;

  ProductState({
    this.products = const [],
    this.isLoading = false,
    this.error,
    this.selectedCategory,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
    String? error,
    String? selectedCategory,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

/// Product ViewModel
class ProductViewModel extends StateNotifier<ProductState> {
  final ProductRepository _repository;

  ProductViewModel(this._repository) : super(ProductState());

  Future<void> loadProducts({String? category}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final products = await _repository.getProducts(category: category);
      state = state.copyWith(
        products: products,
        isLoading: false,
        selectedCategory: category,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      await loadProducts();
      return;
    }

    state = state.copyWith(isLoading: true, error: null);
    try {
      final products = await _repository.searchProducts(query);
      state = state.copyWith(products: products, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Product ViewModel Provider
final productViewModelProvider =
    StateNotifierProvider<ProductViewModel, ProductState>((ref) {
      return ProductViewModel(ProductRepository());
    });
