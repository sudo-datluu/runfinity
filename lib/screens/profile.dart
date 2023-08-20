import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widget/appText.dart';

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
          ],
        )),
      ),
    );
  }
}
