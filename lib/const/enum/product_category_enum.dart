enum ProductCategory {
  hijab,
  caps,
  niqabPati,
  saudiNiqab,
  pins,
}

extension ProductCategoryExtension on ProductCategory {
  String get label {
    switch (this) {
      case ProductCategory.hijab:
        return 'Hijab';
      case ProductCategory.caps:
        return 'Caps';
      case ProductCategory.niqabPati:
        return 'Niqab Pati';
      case ProductCategory.saudiNiqab:
        return 'Saudi Niqab';
      case ProductCategory.pins:
        return 'Pins';
    }
  }
}
