import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_form_field.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/cubit/sign_in_cubit.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
          ),
          Container(
            padding: const EdgeInsets.all(65),
            width: double.infinity,
            color: AppColors.primaryColor,
            child: Image.asset(
              AppImages.imgAuthHeader,
              height: 150,
            ),
          ),
          Positioned(
            top: 200.h,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height - 200.h,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    S.of(context).welcomeBack,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Gap(10.h),
                  Text(
                    S.of(context).loginToYourAccount,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Gap(30.h),
                  Form(
                    key: SignInCubit.get(context).formKey,
                    child: CustomTextFormField(
                      controller: SignInCubit.get(context).emailController,
                      hintText: S.of(context).email,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: SvgPicture.asset(
                        AppIcons.iconsEmail,
                      ),
                    ),
                  ),
                  Gap(60.h),
                  CustomButton(onPressed: () {}, text: S.of(context).login),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
