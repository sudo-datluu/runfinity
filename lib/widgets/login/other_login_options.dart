import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';

class OtherLoginOptions extends StatelessWidget {
  const OtherLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: AppColors.neutral600,
                height: 1,
                width: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AppText(
                text: 'Or continue with',
                size: 12,
                color: AppColors.neutral600,
              ),
            ),
            Expanded(
              child: Container(
                color: AppColors.neutral600,
                height: 1,
                width: 30,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 98,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.neutral750,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.neutral600),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), 
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), 
                  ),
                ],
              ),
              child: Center(child: Image.asset('images/google.png')),
            ),
            Container(
              width: 98,
              height: 72,
              decoration: BoxDecoration(
                  color: AppColors.neutral750,
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: AppColors.neutral600)),
              child: Center(child: Image.asset('images/facebook.png')),
            ),
            Container(
              width: 98,
              height: 72,
              decoration: BoxDecoration(
                  color: AppColors.neutral750,
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: AppColors.neutral600)),
              child: Center(child: Image.asset('images/twitter.png')),
            )
          ],
        ),
      ],
    );
  }
}
