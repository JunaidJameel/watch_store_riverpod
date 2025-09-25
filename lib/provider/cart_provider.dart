import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_store/model/watch_model.dart';

final cartProvider =
    StateNotifierProvider<CartNotifier, List<WatchModel>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<WatchModel>> {
  CartNotifier() : super([]);

  void addToCart(WatchModel watch) {
    if (!state.any((w) => w.id == watch.id)) {
      state = [...state, watch];
    }
  }

  void removeFromCart(int id) {
    state = state.where((watch) => watch.id != id).toList();
  }

  double get total {
    return state.fold<double>(0, (sum, item) => sum + item.price);
  }
}
