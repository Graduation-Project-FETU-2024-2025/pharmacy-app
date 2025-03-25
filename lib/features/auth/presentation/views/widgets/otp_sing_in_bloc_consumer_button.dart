import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/toast.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/otp_cubit/otp_state.dart';
import 'package:pharmacy_app/features/auth/presentation/views/widgets/loading_widget.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class OtpSignInBlocConsumerButton extends StatelessWidget {
  const OtpSignInBlocConsumerButton({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          current is OtpCheckSuccess || current is OtpCheckFailure,
      listener: (context, state) {
        if (state is OtpCheckSuccess) {
          context.pushNamedAndRemoveUntil(Routing.homeView,
              predicate: (route) => false);
        } else if (state is OtpCheckFailure) {
          errorToast(message: state.apiErrorModel.message!);
        }
      },
      buildWhen: (previous, current) =>
          current is OtpCheckSuccess ||
          current is OtpCheckFailure ||
          current is OtpCheckLoading,
      builder: (context, state) {
        return state is OtpCheckLoading
            ? LoadingWidget()
            : CustomButton(
                onPressed: () {
                  OtpCubit.get(context).submitOtp(email);
                },
                text: S.of(context).Continue,
              );
      },
    );
  }
}
