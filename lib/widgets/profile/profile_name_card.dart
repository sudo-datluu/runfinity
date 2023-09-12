import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';

class ProfileNameCard extends StatelessWidget {
  const ProfileNameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.neutral600,
        border: Border.all(color: AppColors.neutral500),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const CircleAvatar(),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'HELLO!',
                color: AppColors.neutral300,
                size: 12,
              ),
              AppText(
                text: 'Ronaldo',
                fontWeight: FontWeight.w700,
                size: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
