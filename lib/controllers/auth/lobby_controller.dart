import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/utils/api_services.dart';
import 'package:runfinity/widgets/appText.dart';

class LobbyController extends GetxController {
  TextEditingController locationAddressEditingController = TextEditingController();
  TextEditingController limitMemberEditingController = TextEditingController();
  TextEditingController lobbyNameEditingController = TextEditingController();

  final String lobbycreateUrl = "auth/createlobby";

  Future<void> LoginService() async {
    try {
      final body = {
        "targetLocationLat": 123, //create a method to get lat and long from location
        "targetLocationLong": 123, // create a method to fill in text for search place
        "targetLocationAddressFormat": "123", // todo get full name for searching
        "limitMembers": limitMemberEditingController.text,
        "createdAt": "123",
        "name": lobbyNameEditingController.text,
      };
      
      final res = await APIServices.postDataAPI(lobbycreateUrl, body);
      if (res.statusCode == 200) {

      }
      
    } catch (err) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: AppText(
              text: "Error",
              size: 18,
            ),
            contentPadding: EdgeInsets.all(20),
            children: [
              Center(
                child: Text(err.toString()),
              )
            ],
          );
        }
      );
    }
  }
}