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
        watchName: 'TaNGOMART',
        watchImage: Assets.images.a1.path),
    WatchModel(
        id: 2,
        price: 99.0,
        watchName: 'DW MART',
        watchImage: Assets.images.a2.path),
    WatchModel(
        id: 3,
        price: 120.0,
        watchName: 'Rolex',
        watchImage: Assets.images.a3.path),
    WatchModel(
        id: 4,
        price: 149.0,
        watchName: 'Brown',
        watchImage: Assets.images.a4.path),
    WatchModel(
        id: 5,
        price: 169.0,
        watchName: 'Omni',
        watchImage: Assets.images.a5.path),
  ];
}
