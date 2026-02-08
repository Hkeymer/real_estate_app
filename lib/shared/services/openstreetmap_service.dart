import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real_estate_app/shared/models/property/location_model.dart';

class OpenStreetMapService {
  static const _baseUrl = 'https://nominatim.openstreetmap.org';

  /// 🔍 AUTOCOMPLETE / SEARCH
  static Future<List<PropertyLocation>> searchPlaces(String query) async {
    if (query.isEmpty) return [];

    final uri = Uri.parse(
      '$_baseUrl/search'
      '?q=$query'
      '&format=json'
      '&addressdetails=1'
      '&limit=5'
      '&countrycodes=co',
    );

    final response = await http.get(
      uri,
      headers: {
        'User-Agent': 'real_estate_app', // OBLIGATORIO para Nominatim
      },
    );

    if (response.statusCode != 200) return [];

    final List data = json.decode(response.body);

    return data.map((item) {
      final address = item['address'] ?? {};

      return PropertyLocation(
        address: item['display_name'],
        city: address['city'] ?? address['town'] ?? address['village'] ?? '',
        state: address['state'] ?? '',
        country: address['country'] ?? '',
        lat: double.parse(item['lat']),
        lng: double.parse(item['lon']),
      );
    }).toList();
  }
}
