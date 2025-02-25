import 'package:zalada_app/core/model/product_model.dart';

class FavoriteModelDb extends Product {
  final String id;
  final String title;
  final String description;
  final String image;
  final num price;

  FavoriteModelDb({
    required this.id,
    required this.title,
   required this.description,
   required this.image,
    required this.price,
  });

  // تحويل من Map إلى Object
  factory FavoriteModelDb.fromMap(Map<String, dynamic> map) {
    return FavoriteModelDb(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      price: map['price'],
    );
  }

  // تحويل من Object إلى Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
    };
  }
}
