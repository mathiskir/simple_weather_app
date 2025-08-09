import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_weather_app/data/objects/api_forecast_response.dart';

class WeatherApi {
  Future<ApiForecastResponse> fetchForecast(String city, String apikey) async {
    final queryParameters = {
      'q': city,
      'lang': 'de',
      'days': '3'
    };
    final headers = {
      "key": apikey,
    };
    final result = await http.get(
      Uri.https(
        'api.weatherapi.com',
        '/v1/forecast.json',
        queryParameters,
      ),
      headers: headers,
    );
    final parsedJson = jsonDecode(result.body);
    final response = ApiForecastResponse.fromJson(parsedJson);
    return response;
  }
}
