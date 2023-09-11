import 'dart:convert';
import 'package:http/http.dart' as http;

class APIServices {
  static const apiBaseUrl = 'http://10.0.2.2:8000/api/v1/';

  static Future<dynamic> getDataAPI(String endpointUrl) async {
    final url = Uri.parse(apiBaseUrl + endpointUrl);

    final res = await http.get(url);

    return res;
  }

  static Future<dynamic> postDataAPI(
      String endpointUrl, Map<String, dynamic>? body) async {
    final url = Uri.parse(apiBaseUrl + endpointUrl);

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'User-Agent': 'Runfinity',
      'Origin': 'http://127.0.0.1:56820/fWyHvEKkXjg=/',
    };

    final msg = body != null ? jsonEncode(body) : null;

    final res = await http.post(url, headers: headers, body: msg);

    return res;
  }
}
