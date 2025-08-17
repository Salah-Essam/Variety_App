import 'package:variety_app/core/remote/api_keys.dart';
import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: (json[Apikeys.id] as num).toInt(),
      title: json[Apikeys.title],
      price: (json[Apikeys.price] as num).toDouble(),
      description: json[Apikeys.description],
      category: json[Apikeys.category],
      image: json[Apikeys.image],
    );
  }
}
