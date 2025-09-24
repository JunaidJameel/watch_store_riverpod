class WatchModel {
  final int id;
  final String watchName;
  final String watchImage;
  final double price;

  WatchModel({
    required this.id,
    required this.price,
    required this.watchImage,
    required this.watchName,
  });

  WatchModel copywith({
    int? id,
    String? watchName,
    String? watchImage,
    double? price,
  }) {
    return WatchModel(
        id: id ?? this.id,
        price: price ?? this.price,
        watchImage: watchImage ?? this.watchImage,
        watchName: watchName ?? this.watchName);
  }
}
