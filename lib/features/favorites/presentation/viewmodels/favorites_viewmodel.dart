import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../products/domain/models/product_model.dart';

/// Favorites State
class FavoritesState {
  final List<ProductModel> favorites;
  final bool isLoading;

  FavoritesState({this.favorites = const [], this.isLoading = false});

  int get totalFavorites => favorites.length;

  bool isFavorite(String productId) {
    return favorites.any((product) => product.id == productId);
  }

  FavoritesState copyWith({List<ProductModel>? favorites, bool? isLoading}) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// Favorites ViewModel
class FavoritesViewModel extends StateNotifier<FavoritesState> {
  FavoritesViewModel() : super(FavoritesState());

  void addToFavorites(ProductModel product) {
    if (!state.isFavorite(product.id)) {
      state = state.copyWith(favorites: [...state.favorites, product]);
    }
  }

  void removeFromFavorites(String productId) {
    final updatedFavorites = state.favorites
        .where((product) => product.id != productId)
        .toList();
    state = state.copyWith(favorites: updatedFavorites);
  }

  void toggleFavorite(ProductModel product) {
    if (state.isFavorite(product.id)) {
      removeFromFavorites(product.id);
    } else {
      addToFavorites(product);
    }
  }

  void clearFavorites() {
    state = state.copyWith(favorites: []);
  }
}

/// Favorites ViewModel Provider
final favoritesViewModelProvider =
    StateNotifierProvider<FavoritesViewModel, FavoritesState>((ref) {
      return FavoritesViewModel();
    });
