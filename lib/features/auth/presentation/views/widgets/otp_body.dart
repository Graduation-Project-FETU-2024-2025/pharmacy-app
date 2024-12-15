import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/auth/presentation/views/widgets/otp_digits_section.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(20.h),
          Image.asset(
            AppImages.imgOTP,
          ),
          Gap(20.h),
          Text(
            S.of(context).enterOTP,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Gap(10.h),
          Text(
            S.of(context).enterOTPWeSent,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.black.withOpacity(.3),
                  fontWeight: FontWeight.w500,
                ),
          ),
          Gap(10.h),
          Text(
            email,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
          Gap(30.h),
          OTPDigitsSection(),
          Gap(30.h),
          CustomButton(onPressed: () {}, text: S.of(context).Continue),
          Gap(18.h),
          Text(
            S.of(context).haveNotReceivedOTP,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.black.withOpacity(.3),
                  fontWeight: FontWeight.w500,
                ),
          ),
          Gap(10.h),
          TextButton(
            onPressed: () {},
            child: Text(
              S.of(context).resend,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
