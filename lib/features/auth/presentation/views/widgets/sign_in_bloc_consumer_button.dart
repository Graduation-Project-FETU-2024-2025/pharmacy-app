import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/toast.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_state.dart';
import 'package:pharmacy_app/features/auth/presentation/views/widgets/loading_widget.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class SignInBlocConsumerButton extends StatelessWidget {
  const SignInBlocConsumerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signInCubit = SignInCubit.get(context);
    return BlocConsumer<SignInCubit, SignInState>(
      listenWhen: (previous, current) =>
          current is SignInSuccess || current is SignInFailure,
      listener: (context, state) {
        if (state is SignInSuccess) {
          successToast(message: state.message);
          context.pushNamed(Routing.otp,
              argument: signInCubit.emailController.text);
        } else if (state is SignInFailure) {
          signInCubit.emailController.clear();
          errorToast(message: state.message);
        }
      },
      buildWhen: (previous, current) =>
          current is SignInSuccess ||
          current is SignInFailure ||
          current is SignInLoading,
      builder: (context, state) {
        return state is SignInLoading
            ? LoadingWidget()
            : CustomButton(
                onPressed: () {
                  if (signInCubit.formKey.currentState!.validate()) {
                    signInCubit.signUpStateEmitter();
                  }
                },
                text: S.of(context).login,
              );
      },
    );
  }
}

