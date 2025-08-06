import 'package:variety_app/core/remote/api_constants.dart';
import 'package:variety_app/core/remote/api_service.dart';
import 'package:variety_app/data/models/product_model.dart';

class Productlistcontroller {
  final ApiService apiService = ApiService();

  Future<List<Product>> getProducts() async {
    try {
      final response = await apiService.get(path: ApiConstants.productsUrl);
      final List<dynamic> dataList = response.data as List;
      if (response.statusCode == 200) {
        return dataList.map((e) => Product.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
