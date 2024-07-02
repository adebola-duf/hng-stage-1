import 'dart:ui';

class Shoe {
  const Shoe({
    required String imageFileNAme,
    required this.color,
    required this.priceInTypeDouble,
    required this.description,
    this.shouldShowInList = true,
    this.needsRotation = false,
  })  : imagePath = 'assets/images/$imageFileNAme',
        price = '₦$priceInTypeDouble';

  String get name {
    String fileName = imagePath.split('/').last;
    return fileName
        .substring(0, fileName.lastIndexOf('.'))
        .replaceAll('-', ' ');
  }

  final String imagePath;
  final bool shouldShowInList;
  final Color color;
  final String price;
  final double priceInTypeDouble;
  final String description;
  final bool needsRotation;
}
