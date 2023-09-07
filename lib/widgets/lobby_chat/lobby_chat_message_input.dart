import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/controllers/chat/lobby_chat_controller.dart';
import 'package:runfinity/styles/app_colors.dart';

class LobbyMessageInput extends StatefulWidget {
  const LobbyMessageInput({super.key});

  @override
  State<LobbyMessageInput> createState() => _LobbyMessageInputState();
}

class _LobbyMessageInputState extends State<LobbyMessageInput>
    with SingleTickerProviderStateMixin {
  final _lobbyChatController = Get.put(LobbyChatController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColors.neutral600,
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                style: IconButton.styleFrom(),
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.white54,
                ),
              ),
              Flexible(
                child: TextFormField(
                  textInputAction: TextInputAction.send,
                  keyboardType: TextInputType.text,
                  controller: _lobbyChatController.lobbyChatTextController,
                  decoration: const InputDecoration(
                      hintText: "This is an example message...",
                      hintStyle: TextStyle(
                        color: AppColors.neutral500,
                      )),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white54,
                  ),
                  onFieldSubmitted: (value) {
                    if (value.trim().isEmpty) return;

                    _lobbyChatController.postLobbyMessages(value);
                  },
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(),
                onPressed: () {
                  String value = _lobbyChatController.lobbyChatTextController.text;
                  if (value.trim().isEmpty) return;

                  _lobbyChatController.postLobbyMessages(value);
                  
                  FocusScope.of(context).unfocus();
                },
                icon: const Icon(
                  Icons.send,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
