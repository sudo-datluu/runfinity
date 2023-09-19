import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/models/lobby_model.dart';
import 'package:runfinity/screens/lobby_screens/lobby_chat_screen.dart';
import 'package:runfinity/screens/lobby_screens/lobby_screen.dart';
import 'package:runfinity/screens/login.dart';
import 'package:runfinity/utils/api_services.dart';

import '../../widgets/app_text.dart';
import './profile_controller.dart';

class LobbyController extends GetxController {
  TextEditingController locationAddressEditingController = TextEditingController();
  TextEditingController limitMemberEditingController = TextEditingController();
  TextEditingController lobbyNameEditingController = TextEditingController();

  LobbyModel? lobbyModel;

  final _profileController = Get.put(ProfileController());

  final String lobbycreateUrl = "lobby/create";
  final String lobbyjoinUrl = "lobby/join";
  final String lobbyleftUrl = "lobby/left";

  Future<void> CreateLobbyService() async {

    try {

      if (_profileController.userProfile == null) {
        print("User is not authorized");
        Get.off(const Login());
      }

      final body = {
        "targetLocationLat": "123", //create a method to get lat and long from location
        "targetLocationLong": "123", // create a method to fill in text for search place
        "targetLocationAddressFormat": "123", // todo get full name for searching
        "limitMembers": limitMemberEditingController.text,
        "currentMembers": "1",
        "createdAt": "2002-12-12",
        "name": "darling harbour", //todo lobbyNameEditin...
        "memberID": _profileController.userProfile!.id
      };

      final res = await APIServices.postDataAPI(lobbycreateUrl, body);
      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);
        lobbyModel = LobbyModel.fromJson(jsonResponse);
        Get.off(const LobbyChatScreen());
      }
      else {
        print("error in post api");
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
        final jsonResponse = jsonDecode(res.body);
        lobbyModel = LobbyModel.fromJson(jsonResponse);

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
              contentPadding: const EdgeInsets.all(20),
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

  Future<void> LeftLobbyService() async {
    try {

      if (lobbyModel != null) {
        final body = {
          "id": lobbyModel!.id,
        };

        final res = await APIServices.postDataAPI(lobbyleftUrl, body);
        if (res.statusCode == 200) {
          Get.off(const LobbyScreen());
        }
      }
      else {
        print("This lobby is not exist");
        Get.off(const LobbyScreen());
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
              contentPadding: const EdgeInsets.all(20),
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