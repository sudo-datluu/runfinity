import 'dart:convert';

import 'package:get/get.dart';
import 'package:runfinity/models/user_model.dart';
import 'package:runfinity/utils/api_services.dart';

class ProfileController extends GetxController {
  String token = '';
  UserModel? userProfile;

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  Future<void> getUserProfile() async {
    final res = await APIServices.getDataAPI('auth/profile');

    if (res.statusCode == 200) {
      final jsonResponse = jsonDecode(res.body);

      userProfile = UserModel.fromJson(jsonResponse);
    } else {
      // ignore: avoid_print
      print('Request failed with status: ${res.statusCode}');
    }
  }
}
