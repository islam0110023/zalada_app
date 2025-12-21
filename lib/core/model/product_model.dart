abstract class Product {
  String get id;
  String get title;
  String get image;
  num get price;
   String get description;

}
class ProductModel extends Product{

  factory ProductModel.fromJson( json){
    return ProductModel(
      id: json['id'].toString(),
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] == null ? null : Rating.fromJson(json['rating']),
    );
  }
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  final String id;
  @override
  final String title;
  @override
  final num price;
  @override
  final String description;
  final String? category;
  @override
  final String image;
  final Rating? rating;

}

class Rating {

  factory Rating.fromJson( json){
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
  Rating({
    required this.rate,
    required this.count,
  });

  final num? rate;
  final int? count;

}
