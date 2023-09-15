import 'package:get/get.dart';
import 'package:runfinity/controllers/auth/profile_controller.dart';
import 'package:runfinity/utils/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RefreshTokenController extends GetxController {
  final _profileController = Get.put(ProfileController());

  Future<bool> isFirstLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstLogin = prefs.getBool('firstLogin') ?? false;
    return firstLogin;
  }

  Future<void> refreshToken() async {
    bool firstLogin = await isFirstLogin();

    if (firstLogin) {
      final res = await APIServices.postDataAPI('token/refresh', null);

      _profileController.token = res.body;
    }
  }
}
