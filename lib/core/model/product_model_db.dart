import 'package:zalada_app/core/model/product_model.dart';

class CartModelDb extends Product{
  final String id;
  final String title;
  final String description;
  final String image;
  final int quantity;
  final double price;

  CartModelDb({
    required this.id,
    required this.title,
    required
    this.description,
    required
    this.image,
    required this.quantity,
    required this.price,
  });

  factory CartModelDb.fromMap(Map<String, dynamic> map) {
    return CartModelDb(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}
