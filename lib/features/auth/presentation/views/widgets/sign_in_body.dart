import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_form_field.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/cubit/sign_in_cubit.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        CustomButton(
            onPressed: () {
              context.pushNamed(Routing.otp);
            },
            text: S.of(context).login),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
