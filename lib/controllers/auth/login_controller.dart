import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/screens/lobby_screens/lobby_screen.dart';
import 'package:runfinity/utils/api_services.dart';
import 'package:runfinity/widgets/appText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginService() async {
    try {
      final body = {
        "username": usernameController.text,
        "password": passwordController.text
      };

      final res = await APIServices.postDataAPI('auth/login', body);

      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);

        var token = jsonResponse['access'];

        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);

        usernameController.clear();
        passwordController.clear();

        Get.off(const LobbyScreen());
      } else {
        throw jsonDecode(res.body)["msg"] ?? "Unknown Error Occured";
      }
    } catch (err) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: AppText(
                text: 'Error',
                size: 18,
              ),
              contentPadding: const EdgeInsets.all(20),
              children: [Center(child: Text(err.toString()))],
            );
          });
    }
  }
}
