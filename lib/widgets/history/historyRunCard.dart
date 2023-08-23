import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/appText.dart';

class HistoryRunCard extends StatelessWidget {
  const HistoryRunCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.neutral750,
        border: Border.all(color: AppColors.neutral600),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              AppText(
                text: '27 May',
                size: 16,
                color: AppColors.primary,
              ),
              Row(
                children: [
                  AppText(
                    text: '12,4 km',
                    color: AppColors.neutral300,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.fiber_manual_record,
                    color: AppColors.neutral300,
                    size: 10,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  AppText(
                    text: '1222 kcal',
                    color: AppColors.neutral300,
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              AppText(
                text: '11,120',
                fontWeight: FontWeight.w700,
                size: 22,
              ),
              const SizedBox(
                width: 5,
              ),
              AppText(
                text: 'Steps',
                size: 17,
              )
            ],
          )
        ],
      ),
    );
  }
}
