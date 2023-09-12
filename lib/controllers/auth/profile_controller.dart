import 'package:get/get.dart';
import 'package:runfinity/models/user_model.dart';
import 'package:runfinity/utils/api_services.dart';

class ProfileController extends GetxController {
  String token = '';
  RxList<UserModel> userProfile = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  Future<void> getUserProfile() async {
    final res = await APIServices.getDataAPI('auth/profile');

    print(res.body);
  }
}
