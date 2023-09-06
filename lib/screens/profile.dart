import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';
import 'package:runfinity/widgets/profile/profile_menu.dart';
import 'package:runfinity/widgets/profile/profile_name_card.dart';

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
            const ProfileNameCard(),
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
                text: 'Account Settings',
                fontWeight: FontWeight.w700,
                size: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ProfileMenu()
          ],
        )),
      ),
    );
  }
}
