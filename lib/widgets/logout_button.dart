import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';

// ignore: must_be_immutable
class LogOutButton extends StatelessWidget {
  VoidCallback handleLogOut;
  LogOutButton({super.key, required this.handleLogOut});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(top: 20),
        child: FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 8.0,
              backgroundColor: AppColors.destructive,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                  color: AppColors.neutral600,
                  width: 1.0,
                ),
              ),
            ),
            onPressed: () {
              handleLogOut();
            },
            child: AppText(
              text: 'Log Out',
              size: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
