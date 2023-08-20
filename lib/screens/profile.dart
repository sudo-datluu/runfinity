import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';

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
       child: SafeArea(child: ),
        ),
      );
    
  }
}
