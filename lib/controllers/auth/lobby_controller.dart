import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/screens/lobby_screens/lobby_chat_screen.dart';
import 'package:runfinity/utils/api_services.dart';

import '../../widgets/app_text.dart';
import './profile_controller.dart';

class LobbyController extends GetxController {
  TextEditingController locationAddressEditingController = TextEditingController();
  TextEditingController limitMemberEditingController = TextEditingController();
  TextEditingController lobbyNameEditingController = TextEditingController();

  final _profileController = Get.put(ProfileController());

  final String lobbycreateUrl = "lobby/create";
  final String lobbyjoinUrl = "lobby/join";

  Future<void> CreateLobbyService() async {
    try {
      final body = {
        "targetLocationLat": 123, //create a method to get lat and long from location
        "targetLocationLong": 123, // create a method to fill in text for search place
        "targetLocationAddressFormat": "123", // todo get full name for searching
        "limitMembers": limitMemberEditingController.text,
        "currentMembers": 1,
        "createdAt": "2002-12-12",
        "name": "darling harbour1", //todo lobbyNameEditin...
        "memberID": _profileController.userProfile!.id
      };

      final res = await APIServices.postDataAPI(lobbycreateUrl, body);
      if (res.statusCode == 200) {
        Get.off(const LobbyChatScreen());
      }

      
    } catch (err) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: AppText(
              text: "Create Lobby Error",
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

  Future<void> JoinLobbyService(id) async {
    try {
      final body = {
        "id": id,
      };

      final res = await APIServices.postDataAPI(lobbyjoinUrl, body);
      if (res.statusCode == 200) {
        Get.off(const LobbyChatScreen());
      }


    } catch (err) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: AppText(
                text: "Join Lobby Error",
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