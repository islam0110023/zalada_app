import 'package:zalada_app/core/model/product_model.dart';

class FavoriteModelDb extends Product {

  FavoriteModelDb({
    required this.id,
    required this.title,
   required this.description,
   required this.image,
    required this.price,
  });

  factory FavoriteModelDb.fromMap(Map<String, dynamic> map) {
    return FavoriteModelDb(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      price: map['price'],
    );
  }
  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;
  @override
  final num price;

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
