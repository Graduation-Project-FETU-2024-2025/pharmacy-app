import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          Spacer(),
          Text(
            S.of(context).onboarding,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Spacer(),
          CustomButton(
            onPressed: () {
              ChangeLanguageCubit.get(context).changeLanguage(language: 'ar');
            },
            text: 'أكمل باللغة العربية',
            backgroundColor: AppColors.secondaryColor,
          ),
          SizedBox(
            height: 36.h,
          ),
          CustomButton(
            onPressed: () {
              ChangeLanguageCubit.get(context).changeLanguage(language: 'en');
            },
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
