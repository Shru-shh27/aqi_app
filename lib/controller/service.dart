import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:aqi_monitor/model/aqi_model.dart';


class API{
  static final String? BASE_URL= dotenv.env['BASE_URL'];
  static final String? TOKEN= dotenv.env['TOKEN'];


  static Future<AqiResponse> getAQI(String location) async {
    Uri url= Uri.parse("${BASE_URL!}$location/?token=${TOKEN!}");


    try {
      final response= await http.get(url);
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      final aqiResponse = AqiResponse.fromJson(jsonMap);
      return aqiResponse;
    } catch (e) {
      throw Exception("Failed to fetch AQI");
    }
  }
}



