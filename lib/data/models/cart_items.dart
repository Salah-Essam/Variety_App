import 'package:variety_app/core/remote/api_keys.dart';

class CartItems {
  final int productId;
  final int quantity;
  CartItems({required this.productId, required this.quantity});

  factory CartItems.fromJson(Map<String, dynamic> json) => CartItems(
    productId: json[Apikeys.productId],
    quantity: json[Apikeys.quantity],
  );
}
