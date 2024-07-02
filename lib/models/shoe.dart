import 'dart:ui';

class Shoe {
  const Shoe({
    required String imageFileNAme,
    required this.color,
    required double price,
    required this.description,
    this.needsRotation = false,
  })  : imagePath = 'assets/images/$imageFileNAme',
        price = '₦$price';

  String get name {
    String fileName = imagePath.split('/').last;
    return fileName
        .substring(0, fileName.lastIndexOf('.'))
        .replaceAll('-', ' ');
  }

  final String imagePath;
  final Color color;
  final String price;
  final String description;
  final bool needsRotation;
}
