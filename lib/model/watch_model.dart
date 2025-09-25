class WatchModel {
  final int id;
  final String watchName;
  final String watchImage;
  final double price;
  final List<String> category;

  WatchModel({
    required this.id,
    required this.price,
    required this.watchImage,
    required this.watchName,
    required this.category,
  });

  WatchModel copywith({
    int? id,
    String? watchName,
    String? watchImage,
    double? price,
    List<String>? category,
  }) {
    return WatchModel(
      id: id ?? this.id,
      price: price ?? this.price,
      watchImage: watchImage ?? this.watchImage,
      watchName: watchName ?? this.watchName,
      category: category ?? this.category,
    );
  }
}
