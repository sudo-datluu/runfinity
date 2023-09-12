import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';

// ignore: must_be_immutable
class LobbyChatMessageCard extends StatelessWidget {
  String username;
  String content;
  String createdAt;
  bool isHost;
  bool isSender;

  LobbyChatMessageCard({
    super.key,
    required this.username,
    required this.content,
    required this.createdAt,
    required this.isHost,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('images/onboardingscreen1.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppText(
                    text: username,
                    size: 22,
                    color: isHost ? AppColors.alertLight : AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: AppText(
                      text: createdAt,
                      color: AppColors.neutral400,
                    ),
                  )
                ],
              ),
              AppText(
                text: content,
                size: 18,
                fontWeight: FontWeight.w600,
              )
            ],
          )
        ],
      ),
    );
  }
}
