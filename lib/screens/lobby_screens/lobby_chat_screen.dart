import 'package:flutter/material.dart';
import 'package:runfinity/widgets/app_text.dart';
import 'package:runfinity/widgets/lobby_chat/lobby_chat_messages.dart';
import 'package:runfinity/styles/app_colors.dart';

import '../../widgets/lobby_chat/lobby_chat_message_input.dart';

class LobbyChatScreen extends StatefulWidget {
  const LobbyChatScreen({super.key});

  @override
  State<LobbyChatScreen> createState() => _LobbyChatScreenState();
}

class _LobbyChatScreenState extends State<LobbyChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.neutral700,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText(
          text: 'Lobby #001',
          size: 25,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.group,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Target",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Dis. range: 5-10km",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Member: 3/4",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {},
                    child: AppText(
                      text: 'Start',
                      size: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const LobbyChatMessages(),
              LobbyMessageInput(),
            ],
          ),
        ),
      ),
    );
  }
}
