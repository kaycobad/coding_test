import 'dart:convert';
import 'package:coding_test/data/models/trending_product_model.dart';
import 'package:coding_test/utility/utility.dart';
import 'package:http/http.dart' as http;

abstract class TrendingProductRepository {
  Future<List<TrendingProductModel>> getTrendingProduct();
}

class TrendingProductRepositoryImpl extends TrendingProductRepository {
  @override
  Future<List<TrendingProductModel>> getTrendingProduct() async {
    bool _isInternetAvailable = await isInternetAvailable();
    if (_isInternetAvailable) {
      var response =
          await http.get(Uri.parse(ApiEndPoints().trendingProductsApi));
      if (response.statusCode == 200) {
        cacheResponseData('trendingProductOfflineData', response.body);
        var data = json.decode(response.body);
        List<TrendingProductModel> trendingProducts = data[0]
            .map((j) => TrendingProductModel.fromJson(j))
            .toList()
            .cast<TrendingProductModel>();
        return trendingProducts;
      } else {
        throw Exception('Something went wrong!');
      }
    } else {
      String? trendingProductOfflineData =
          await getCachedData('trendingProductOfflineData');
      if (trendingProductOfflineData == null) {
        throw Exception('No internet connection & no cache data.');
      } else {
        var data = json.decode(trendingProductOfflineData);
        List<TrendingProductModel> trendingProducts = data[0]
            .map((j) => TrendingProductModel.fromJson(j))
            .toList()
            .cast<TrendingProductModel>();
        return trendingProducts;
      }
    }
  }
}
