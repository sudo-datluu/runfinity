import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';
import 'package:runfinity/widgets/lobby_chat/lobby_chat_message_card.dart';

class LobbyChatMessages extends StatefulWidget {
  const LobbyChatMessages({super.key});

  @override
  State<LobbyChatMessages> createState() => _LobbyChatMessagesState();
}

class _LobbyChatMessagesState extends State<LobbyChatMessages> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const LobbyChatMessageCard(),
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
