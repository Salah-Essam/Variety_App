import 'package:variety_app/core/remote/api_keys.dart';
import 'package:variety_app/data/models/cart_items.dart';
import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final List<CartItems> products;

  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json[Apikeys.id],
      userId: json[Apikeys.userID],
      date: DateTime.parse(json[Apikeys.date]),
      products: List<CartItems>.from(
        json[Apikeys.products].map((x) => CartItems.fromJson(x)),
      ),
    );
  }
}
