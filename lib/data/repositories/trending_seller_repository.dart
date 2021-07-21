import 'dart:convert';
import 'package:coding_test/data/models/trending_seller_model.dart';
import 'package:coding_test/utility/utility.dart';
import 'package:http/http.dart' as http;

abstract class TrendingSellerRepository {
  Future<List<TrendingSellerModel>> getTrendingSeller();
}

class TrendingSellerRepositoryImpl extends TrendingSellerRepository {
  @override
  Future<List<TrendingSellerModel>> getTrendingSeller() async {
    bool _isInternetAvailable = await isInternetAvailable();
    if (_isInternetAvailable) {
      var response =
          await http.get(Uri.parse(ApiEndPoints().trendingSellersApi));
      if (response.statusCode == 200) {
        cacheResponseData('trendingSellerOfflineData', response.body);
        var data = json.decode(response.body);
        List<TrendingSellerModel> trendingSellers = data[0]
            .map((j) => TrendingSellerModel.fromJson(j))
            .toList()
            .cast<TrendingSellerModel>();
        return trendingSellers;
      } else {
        throw Exception('Something went wrong!');
      }
    } else {
      String? trendingSellerOfflineData =
          await getCachedData('trendingSellerOfflineData');
      if (trendingSellerOfflineData == null) {
        throw Exception('No internet connection & no cache data.');
      } else {
        var data = json.decode(trendingSellerOfflineData);
        List<TrendingSellerModel> trendingSellers = data[0]
            .map((j) => TrendingSellerModel.fromJson(j))
            .toList()
            .cast<TrendingSellerModel>();
        return trendingSellers;
      }
    }
  }
}
