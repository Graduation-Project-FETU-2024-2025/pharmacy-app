import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:pharmacy_app/features/auth/presentation/views/widgets/otp_text_form_filed.dart';

class OTPDigitsSection extends StatelessWidget {
  const OTPDigitsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Form(
        key: OtpCubit.get(context).otpFormKey,
        child: SizedBox(
          height: 75,
          child: Row(
            children: [
              Expanded(
                child: OtpTextFromFiled(
                  controller: OtpCubit.get(context).otpController1,
                  focusNode: OtpCubit.get(context).focusNode1,
                  validator: OtpCubit.get(context).numberValidator,
                  autoFocus: true,
                  onChanged: (p0) => OtpCubit.get(context)
                      .nextFiled(p0, OtpCubit.get(context).focusNode2),
                ),
              ),
              const Gap(10),
              Expanded(
                child: OtpTextFromFiled(
                  controller: OtpCubit.get(context).otpController2,
                  focusNode: OtpCubit.get(context).focusNode2,
                  validator: OtpCubit.get(context).numberValidator,
                  onChanged: (p0) => OtpCubit.get(context)
                      .nextFiled(p0, OtpCubit.get(context).focusNode3),
                ),
              ),
              const Gap(10),
              Expanded(
                child: OtpTextFromFiled(
                  controller: OtpCubit.get(context).otpController3,
                  focusNode: OtpCubit.get(context).focusNode3,
                  validator: OtpCubit.get(context).numberValidator,
                  onChanged: (p0) => OtpCubit.get(context)
                      .nextFiled(p0, OtpCubit.get(context).focusNode4),
                ),
              ),
              const Gap(10),
              Expanded(
                child: OtpTextFromFiled(
                  controller: OtpCubit.get(context).otpController4,
                  focusNode: OtpCubit.get(context).focusNode4,
                  validator: OtpCubit.get(context).numberValidator,
                  onChanged: (p0) {
                    OtpCubit.get(context).focusNode4.unfocus();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
