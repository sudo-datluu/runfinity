import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/models/lobby_chat_messages_model.dart';
import 'package:runfinity/utils/api_services.dart';

import '../auth/profile_controller.dart';

class LobbyChatController extends GetxController {
  TextEditingController lobbyChatTextController = TextEditingController();
  final _profileController = Get.put(ProfileController());

  bool isReady = false;
  bool isHost = false; //compared with host_user_id in lobby api
  bool isSender = false; //compared with token

  RxList<LobbyChatMesagesModel> lobbyMessages = <LobbyChatMesagesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    print('get message');
    getLobbyMessages();
  }

  void getLobbyMessages() async {
    await Future.delayed(const Duration(seconds: 1));

    //fetch api get messages here -> save to lobbyMessages.value
    var res = [
      LobbyChatMesagesModel(
        id: 1,
        user: _profileController.userProfile!,
        content: 'Hello World',
        createdAt: 'Today at 9:39',
      ),
      LobbyChatMesagesModel(
        id: 1,
        user: _profileController.userProfile!,
        content: 'GOAT',
        createdAt: 'Today 9:41',
      ),
      LobbyChatMesagesModel(
        id: 1,
        user: _profileController.userProfile!,
        content: 'Siuiiiii',
        createdAt: 'Today 9:40',
      ),
    ];

    lobbyMessages.value = res.reversed.toList();
  }

  void postLobbyMessages(String messageContent) async {
    LobbyChatMesagesModel message = LobbyChatMesagesModel(
      id: 2,
      content: messageContent,
      user: _profileController.userProfile!, //need to change adapting the backend
      createdAt:
          'Today 6:40', //need to change to current time and type DateTime or Timestamps
    );

    lobbyMessages.insert(0, message);

    lobbyChatTextController.clear();

    //call api post lobby message here...
    await APIServices.postDataAPI('lobby_chat/post_lobby_message', message);
  }
}
