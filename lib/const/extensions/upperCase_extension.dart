// ignore: file_names

extension StringExtension on String {
  /// Capitalizes the first letter of each word in the string.
  String toTitleCase() {
    if (trim().isEmpty) return this;

    return split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) =>
            word[0].toUpperCase() +
            (word.length > 1 ? word.substring(1).toLowerCase() : ''))
        .join(' ');
  }
}
