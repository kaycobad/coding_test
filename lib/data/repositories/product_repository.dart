import 'dart:convert';
import 'package:coding_test/data/models/product_model.dart';
import 'package:coding_test/utility/utility.dart';
import 'package:http/http.dart' as http;

abstract class ProductRepository {
  Future<List<ProductModel>> getProduct();
}

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<List<ProductModel>> getProduct() async {
    bool _isInternetAvailable = await isInternetAvailable();
    if (_isInternetAvailable) {
      var response = await http.get(Uri.parse(ApiEndPoints().productsApi));
      if (response.statusCode == 200) {
        cacheResponseData('productsOfflineData', response.body);
        var data = json.decode(response.body);
        List<ProductModel> products = data[0]
            .map((j) => ProductModel.fromJson(j))
            .toList()
            .cast<ProductModel>();
        return products;
      } else {
        throw Exception('Something went wrong!');
      }
    } else {
      String? productsOfflineData = await getCachedData('productsOfflineData');
      if (productsOfflineData == null) {
        throw Exception('No internet connection & no cache data.');
      } else {
        var data = json.decode(productsOfflineData);
        List<ProductModel> products = data[0]
            .map((j) => ProductModel.fromJson(j))
            .toList()
            .cast<ProductModel>();
        return products;
      }
    }
  }
}
