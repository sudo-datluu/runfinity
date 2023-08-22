import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/appText.dart';
import 'package:runfinity/widgets/history/historyRunCard.dart';
import 'package:runfinity/widgets/history/historyStatBar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.neutral700,
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        text: 'History',
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
                height: 20,
              ),
              const HistoryStatBar(),
              const SizedBox(
                height: 30,
              ),
              const HistoryRunCard()
            ],
          ),
        ),
      ),
    );
  }
}
