import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const apiBaseUrl = 'http://127.0.0.1:8000/api/v1/';


  //test get API, not real url
  // static Future<void> getData() async {
  //   const String BASE_URL = "api.escuelajs.co";
  //   var uri = Uri.https(BASE_URL, "api/v1/products");
  //   var response = await http.get(uri);


  //   if (response.statusCode == 200) {
  //     print('Data fetched successfully');
  //     print('Response: ${response.body}');
  //   } else {
  //     print('Failed to fetch data');
  //     print('Response: ${response.statusCode}');
  //   }
  // }

  static Future<void> postData(String endpoint) async {
    final url = Uri.parse(apiBaseUrl + endpoint);
    
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'User-Agent': 'Runfinity',
      'Origin': 'http://127.0.0.1:56820/fWyHvEKkXjg=/',
    };

    final body = {
      "username": "dat.luu@citizendev.io",
      "password": "matkhau123"
    };

    final msg = jsonEncode(body);

    try {
      final response = await http.post(url, headers: headers, body: msg);

      if (response.statusCode == 200) {
        print('Login successful');
        print('Response: ${response.body}');
        // You might want to handle the response here (e.g., extract authentication token)
      } else {
        print('Login failed');
        print('Response: ${response.statusCode}');
        // You might want to handle different error cases here
      }
    } catch (e) {
      print('An error occurred: $e');
      // Handle network or other errors here
    }
  }
}
