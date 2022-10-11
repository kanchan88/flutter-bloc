import 'package:flutter_weather_bloc/WeatherModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherRepo{
  Future<WeatherModel> getWeatherData(String city) async {
    final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=43ea6baaad7663dc17637e22ee6f78f2");

    if(result.statusCode!=200){
      throw Exception("Something is wrong");
    }

    print(result.body);
    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response){
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded['main'];

    return WeatherModel.fromJson(jsonWeather);
  }
}