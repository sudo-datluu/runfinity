import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';

class LobbyChatMessageCard extends StatefulWidget {
  const LobbyChatMessageCard({super.key});

  @override
  State<LobbyChatMessageCard> createState() => _LobbyChatMessageCardState();
}

class _LobbyChatMessageCardState extends State<LobbyChatMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  text: 'Dani. (Host)',
                  size: 22,
                  color: AppColors.alertLight,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  width: 5,
                ),
                AppText(
                  text: 'Today at 09:39',
                  color: AppColors.neutral400,
                )
              ],
            ),
            AppText(
              text: 'Welcome you to my lobby',
              size: 18,
              fontWeight: FontWeight.w600,
            )
          ],
        )
      ],
    );
  }
}
