import 'package:variety_app/core/remote/api_keys.dart';
import 'package:variety_app/data/models/cart_items.dart';

class CartModel {
  final int id;
  final int userId;
  final DateTime date;
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
