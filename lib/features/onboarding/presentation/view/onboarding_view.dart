import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            'All Services for your health',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Spacer(),
          CustomButton(
            onPressed: () {},
            text: 'أكمل باللغة العربية',
            backgroundColor: AppColors.secondaryColor,
          ),
          SizedBox(
            height: 36.h,
          ),
          CustomButton(
            onPressed: () {},
            text: 'Continue in English',
          ),
          SizedBox(
            height: 50.h,
          )
        ],
      ),
    );
  }
}
