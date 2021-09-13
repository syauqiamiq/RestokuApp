import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/models/restaurant_api_model.dart';
import 'package:restaurant_app/services/api_services.dart';

import 'api_services_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test("Mengambil Data dari API", () async {
    final client = MockClient();
    when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
        .thenAnswer((_) async => http.Response(
            '{"error": false, "message": "success", "count": 20, "restaurants" : []}',
            200));

    expect(await fetchRestaurantTest(client), isA<RestaurantList>());
  });
}
