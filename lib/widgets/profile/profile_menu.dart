import 'package:flutter/material.dart';
import 'package:runfinity/screens/login.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';
import 'package:runfinity/widgets/custom_switch.dart';
import 'package:runfinity/widgets/logout_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  late SharedPreferences _prefs;

  bool status = true;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void handleLogOut() {
    _prefs.remove('token'); 
    _prefs.remove('firstLogin');

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const Login(),
    ));

    //call api logout
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.neutral770,
            border: Border.all(color: AppColors.neutral600),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'Edit Profile',
                size: 18,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 12,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.neutral770,
            border: Border.all(color: AppColors.neutral600),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'Change Password',
                size: 18,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 12,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.neutral770,
            border: Border.all(color: AppColors.neutral600),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'Add Payment Method',
                size: 18,
              ),
              const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.neutral770,
            border: Border.all(color: AppColors.neutral600),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'Allow Notification',
                size: 18,
              ),
              CustomSwitch(
                value: status,
                onChanged: (bool val) {
                  setState(() {
                    status = val;
                  });
                },
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.neutral770,
            border: Border.all(color: AppColors.neutral600),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'About Us',
                size: 18,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 12,
              ),
            ],
          ),
        ),
        LogOutButton(handleLogOut: handleLogOut)
      ],
    );
  }
}
