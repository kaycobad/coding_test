import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Check internet connection
Future<bool> isInternetAvailable() async {
  final Connectivity _internetConnectivity = Connectivity();
  ConnectivityResult result = await _internetConnectivity.checkConnectivity();
  switch (result) {
    case ConnectivityResult.wifi:
      return true;
    case ConnectivityResult.mobile:
      return true;
    case ConnectivityResult.none:
      return false;
    default:
      return false;
  }
}

//save Api response data for offline use
cacheResponseData(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

//get Saved Api Response for offline use
Future<String?> getCachedData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getString(key);
  if (value == null) {
    return null;
  } else {
    return value;
  }
}

//Api endpoints
class ApiEndPoints {
  String baseUrl =
      'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=';
  late String trendingSellersApi = '${baseUrl}trending_seller';
  late String trendingProductsApi = '${baseUrl}trendingProducts';
  late String productsApi = '${baseUrl}stories';
  late String newArrivalsApi = '${baseUrl}newArrivals';
  late String newShopsApi = '${baseUrl}newShops';
}
