import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/controllers/auth/profile_controller.dart';
import 'package:runfinity/screens/navigationBar.dart';
import 'package:runfinity/utils/api_services.dart';
import 'package:runfinity/widgets/app_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _profileController = Get.put(ProfileController());

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
        await prefs.setBool('firstLogin', true);

        usernameController.clear();
        passwordController.clear();

        _profileController.setUserProfile(jsonResponse);

        Get.off(const MainPage());
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
