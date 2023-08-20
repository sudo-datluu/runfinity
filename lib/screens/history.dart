import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widget/appText.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.neutral600,
                  border: Border.all(color: AppColors.neutral500),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
