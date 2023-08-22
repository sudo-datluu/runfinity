import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';

// ignore: must_be_immutable
class LoadRunningModal extends StatelessWidget {
  bool? isLoadRun;

  LoadRunningModal({this.isLoadRun = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoadRun!,
      child: Scaffold(
        body: Container(
            color: Colors.black.withOpacity(0.3),
            child: Center(
                child: Container(
                    width: 327,
                    height: 288,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                        color: AppColors.neutral800,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.primary)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 160,
                            height: 144,
                            child: Image.asset('images/loadRun.png')),
                        const Text(
                          'Preparing your run...',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Our system will track you real-time performance.',
                          style: TextStyle(color: AppColors.neutral400),
                        ),
                      ],
                    )))),
      ),
    );
  }
}
