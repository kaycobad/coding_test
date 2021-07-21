import 'dart:convert';
import 'package:coding_test/data/models/new_shop_model.dart';
import 'package:coding_test/utility/utility.dart';
import 'package:http/http.dart' as http;

abstract class NewShopRepository {
  Future<List<NewShopModel>> getNewShop();
}

class NewShopRepositoryImpl extends NewShopRepository {
  @override
  Future<List<NewShopModel>> getNewShop() async {
    bool _isInternetAvailable = await isInternetAvailable();
    if (_isInternetAvailable) {
      var response = await http.get(Uri.parse(ApiEndPoints().newShopsApi));
      if (response.statusCode == 200) {
        cacheResponseData('newShopOfflineData', response.body);
        var data = json.decode(response.body);
        List<NewShopModel> newShops = data[0]
            .map((j) => NewShopModel.fromJson(j))
            .toList()
            .cast<NewShopModel>();
        return newShops;
      } else {
        throw Exception('Something went wrong!');
      }
    } else {
      String? newShopOfflineData = await getCachedData('newShopOfflineData');
      if (newShopOfflineData == null) {
        throw Exception('No internet connection & no cache data.');
      } else {
        var data = json.decode(newShopOfflineData);
        List<NewShopModel> newShops = data[0]
            .map((j) => NewShopModel.fromJson(j))
            .toList()
            .cast<NewShopModel>();
        return newShops;
      }
    }
  }
}
