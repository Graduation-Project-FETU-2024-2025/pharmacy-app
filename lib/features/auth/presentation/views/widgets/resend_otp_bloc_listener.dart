
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/widgets/toast.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/otp_cubit/otp_state.dart';
import 'package:pharmacy_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendOtpBlocListener extends StatelessWidget {
  const ResendOtpBlocListener({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          current is ResendOTPLoading ||
          current is ResendOTPSuccess ||
          current is ResendOTPFailure,
      listener: (context, state) {
        if (state is ResendOTPFailure) {
          errorToast(message: state.apiErrorModel.message ?? "error");
        }
        if (state is ResendOTPSuccess) {
          successToast(message: S.of(context).emailResentedSuccessfully);
        }
      },
      child: TextButton(
        onPressed: () {
          context.read<OtpCubit>().resendOTP(email);
        },
        child: Text(
          S.of(context).resend,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
