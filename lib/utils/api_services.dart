import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIServices {
  static const apiBaseUrl = 'http://10.0.2.2:8000/api/v1/';

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    return token;
  }

  static Future<dynamic> getDataAPI(String endpointUrl) async {
    final url = Uri.parse(apiBaseUrl + endpointUrl);

    final String? token = await getAccessToken();

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'User-Agent': 'Runfinity',
      'Origin': 'http://127.0.0.1:56820/fWyHvEKkXjg=/',
    };



    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    print(headers);        
    final res = await http.get(url, headers: headers);

    return res;
  }

  static Future<dynamic> postDataAPI(String endpointUrl, body) async {
    final url = Uri.parse(apiBaseUrl + endpointUrl);

    final String? token = await getAccessToken();

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'User-Agent': 'Runfinity',
      'Origin': 'http://127.0.0.1:56820/fWyHvEKkXjg=/',
    };


    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final msg = jsonEncode(body);

    final res = await http.post(url, headers: headers, body: msg);

    return res;
  }
}
