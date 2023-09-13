import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/controllers/chat/lobby_chat_controller.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';
import 'package:runfinity/widgets/lobby_chat/lobby_chat_message_card.dart';

class LobbyChatMessages extends StatefulWidget {
  const LobbyChatMessages({super.key});

  @override
  State<LobbyChatMessages> createState() => _LobbyChatMessagesState();
}

class _LobbyChatMessagesState extends State<LobbyChatMessages> {
  final lobbyChatController = Get.put(LobbyChatController());


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GetX<LobbyChatController>(builder: (controller) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: ListView.builder(
                    reverse: true,
                      itemCount: controller.lobbyMessages.length,
                      itemBuilder: (context, index) {
                        return LobbyChatMessageCard(
                          username: controller.lobbyMessages[index].user.fullname!,
                          content: controller.lobbyMessages[index].content,
                          createdAt: controller.lobbyMessages[index].createdAt,
                          isHost: controller.isHost,
                          isSender: controller.isSender
                        );
                      }),
                );
              }),
            ),
            AppText(
              text: 'Join the lobby',
              color: AppColors.neutral300,
            ),
          ],
        ),
      ),
    );
  }
}
