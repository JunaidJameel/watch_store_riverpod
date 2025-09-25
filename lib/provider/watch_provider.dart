import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/model/watch_model.dart';

// Provider for list of watches
final watchProvider =
    StateNotifierProvider<WatchNotifier, List<WatchModel>>((ref) {
  return WatchNotifier();
});

class WatchNotifier extends StateNotifier<List<WatchModel>> {
  WatchNotifier() : super(_initialWatches);

  // Initial list of watches
  static final List<WatchModel> _initialWatches = [
    WatchModel(
      id: 1,
      price: 199.0,
      watchName: 'Omega Seamaster Diver',
      watchImage: Assets.images.a1.path,
      category: [
        'Trending',
      ],
    ),
    WatchModel(
      id: 2,
      price: 99.0,
      watchName: 'Omega Speedmaster',
      watchImage: Assets.images.a2.path,
      category: ['Popular', 'Best Seller', 'New'],
    ),
    WatchModel(
      id: 3,
      price: 120.0,
      watchName: 'Omega De Ville',
      watchImage: Assets.images.a3.path,
      category: ['Best Seller', 'New'],
    ),
    WatchModel(
      id: 4,
      price: 149.0,
      watchName: 'Omega Constellation',
      watchImage: Assets.images.a4.path,
      category: ['Trending', 'Best Seller'],
    ),
    WatchModel(
      id: 5,
      price: 169.0,
      watchName: 'Omega Aqua Terra',
      watchImage: Assets.images.a5.path,
      category: ['Trending'],
    ),
  ];

  // filter by category

  void filter(String category) {
    if (category == 'Trending') {
      state = _initialWatches;
    } else {
      state = _initialWatches
          .where((watch) => watch.category.contains(category))
          .toList();
    }
  }
}
