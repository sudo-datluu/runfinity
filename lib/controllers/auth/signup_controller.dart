import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/screens/navigationBar.dart';
import 'package:runfinity/utils/api_services.dart';
import 'package:runfinity/widgets/app_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signupService() async {
    try {
      final body = {
        "username": usernameController.text.toString(),
        "password": passwordController.text.toString(),
        "fullname": nameController.text.toString()
      };

      final res = await APIServices.postDataAPI('auth/signup', body);

      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);

        var token = jsonResponse['access'];

        final SharedPreferences prefs = await _prefs;

        await prefs.setBool('firstLogin', true);
        await prefs.setString('token', token);

        nameController.clear();
        usernameController.clear();
        phoneController.clear();
        mailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();

        Get.off(const MainPage());
      } else {
        throw jsonDecode(res.body)["msg"] ?? "Unknown Error Occured";
      }
    } catch (err) {
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
