import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:runfinity/utils/api_services.dart';

class AuthServices {
  static final LocalStorage localStorage = LocalStorage('firstLogin');

  static Future<void> loginService(Map<String, dynamic> body) async {
    try {
      final res = await APIServices.postDataAPI('auth/login', body);

      if (res.statusCode == 200) {
        localStorage.setItem('firstLogin', true);
      } else {
        print('Login failed');
        print('res: ${res.statusCode}');
        // You might want to handle different error cases here
      }
    } catch (e) {
      // ignore: avoid_print
      print('An error occurred: $e');
    }
  }

  static Future<void> refreshTokenService(Map<String, dynamic> body) async {
    final firstLogin = localStorage.getItem("firstLogin");

    if (firstLogin) {
      try {
        final res = await APIServices.postDataAPI('token/refresh', body);
      } catch (e) {
        print('An error occurred: $e');
      }
    }
  }
}
