import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/database/cache/cache_keys.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  void cacheOnboarding(BuildContext context) async {
    await getIt<CacheHelper>()
        .saveData(key: CacheKeys.isFirstTime, value: false);
    if (context.mounted) {
      context.pushReplacementNamed(Routing.branchesScreen);//TODO change to sign in
    }
  }

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
              cacheOnboarding(context);
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
              cacheOnboarding(context);
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
