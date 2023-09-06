import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';

class HistoryStatBar extends StatelessWidget {
  const HistoryStatBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.neutral600,
        border: Border.all(color: AppColors.neutral500),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            Image.asset('images/timer.png'),
            const SizedBox(
              height: 5,
            ),
            AppText(
              text: '18,3 H',
              fontWeight: FontWeight.w700,
              size: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            AppText(
              text: 'Time',
              color: AppColors.neutral300,
            ),
          ],
        ),
        Container(
          height: 30,
          width: 1,
          color: AppColors.neutral500,
        ),
        Column(
          children: [
            Image.asset('images/timer.png'),
            const SizedBox(
              height: 5,
            ),
            AppText(
              text: '18,3 H',
              fontWeight: FontWeight.w700,
              size: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            AppText(
              text: 'Time',
              color: AppColors.neutral300,
            ),
          ],
        ),
        Container(
          height: 30,
          width: 1,
          color: AppColors.neutral500,
        ),
        Column(
          children: [
            Image.asset('images/timer.png'),
            const SizedBox(
              height: 5,
            ),
            AppText(
              text: '18,3 H',
              fontWeight: FontWeight.w700,
              size: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            AppText(
              text: 'Time',
              color: AppColors.neutral300,
            ),
          ],
        ),
      ]),
    );
  }
}
