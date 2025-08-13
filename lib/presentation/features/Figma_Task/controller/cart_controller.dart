import 'package:variety_app/core/remote/api_constants.dart';
import 'package:variety_app/core/remote/api_service.dart';
import 'package:variety_app/data/models/cart_model.dart';

class CartController {
  final ApiService apiService = ApiService();

  Future<List<CartModel>> getCarts() async {
    try {
      final response = await apiService.get(path: ApiConstants.cartUrl);
      final List<dynamic> dataList = response.data as List;
      if (response.statusCode == 200) {
        return dataList.map((e) => CartModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
