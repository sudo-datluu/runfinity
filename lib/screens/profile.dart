import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widget/appText.dart';
import 'package:runfinity/widget/profileMenu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.neutral700,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('images/backButton.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    AppText(
                      text: 'User',
                      fontWeight: FontWeight.w700,
                      size: 18,
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset('images/direct-noti.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('images/sms-noti.png'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
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
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 0.5,
              width: double.maxFinite,
              color: AppColors.neutral100,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: AppText(
                text: 'Account Setting',
                fontWeight: FontWeight.w700,
                size: 20,
              ),
            ),
            const SizedBox(height: 20,),
            const ProfileMenu()
          ],
        )),
      ),
    );
  }
}
