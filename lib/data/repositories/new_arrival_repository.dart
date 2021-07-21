import 'dart:convert';
import 'package:coding_test/data/models/new_arrival_model.dart';
import 'package:coding_test/utility/utility.dart';
import 'package:http/http.dart' as http;

abstract class NewArrivalRepository {
  Future<List<NewArrivalModel>> getNewArrival();
}

class NewArrivalRepositoryImpl extends NewArrivalRepository {
  @override
  Future<List<NewArrivalModel>> getNewArrival() async {
    bool _isInternetAvailable = await isInternetAvailable();
    if (_isInternetAvailable) {
      var response = await http.get(Uri.parse(ApiEndPoints().newArrivalsApi));
      if (response.statusCode == 200) {
        cacheResponseData('newArrivalOfflineData', response.body);
        var data = json.decode(response.body);
        List<NewArrivalModel> newArrivals = data[0]
            .map((j) => NewArrivalModel.fromJson(j))
            .toList()
            .cast<NewArrivalModel>();
        return newArrivals;
      } else {
        throw Exception('Something went wrong!');
      }
    } else {
      String? newArrivalOfflineData =
          await getCachedData('newArrivalOfflineData');
      if (newArrivalOfflineData == null) {
        throw Exception('No internet connection & no cache data.');
      } else {
        var data = json.decode(newArrivalOfflineData);
        List<NewArrivalModel> newArrivals = data[0]
            .map((j) => NewArrivalModel.fromJson(j))
            .toList()
            .cast<NewArrivalModel>();
        return newArrivals;
      }
    }
  }
}
