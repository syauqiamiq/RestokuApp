import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/models/restaurant_api_model.dart';
import 'package:restaurant_app/models/restaurant_detail_model.dart';
import 'package:restaurant_app/models/restaurant_query_model.dart';

class ApiServices {
  Future<RestaurantList> getRestaurant() async {
    final response =
        await http.get(Uri.parse('https://restaurant-api.dicoding.dev/list'));
    if (response.statusCode == 200) {
      var data = RestaurantList.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Gagal Memuat Data');
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    final response = await http.get(
      Uri.parse('https://restaurant-api.dicoding.dev/detail/$id'),
    );

    var data = RestaurantDetail.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Gagal Memuat Data');
    }
  }

  Future<RestaurantQuery> getRestaurantQuery(String context) async {
    final response = await http.get(
      Uri.parse('https://restaurant-api.dicoding.dev/search?q=$context'),
    );

    var data = RestaurantQuery.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Gagal Memuat Data');
    }
  }
}

// METHOD UNIT TESTING API//
Future<RestaurantList> fetchRestaurantTest(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://restaurant-api.dicoding.dev/list'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return RestaurantList.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Restaurant');
  }
}
