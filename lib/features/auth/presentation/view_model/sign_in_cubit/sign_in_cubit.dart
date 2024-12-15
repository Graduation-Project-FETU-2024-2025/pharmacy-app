

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/sign_in_cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  static SignInCubit get(context) => BlocProvider.of<SignInCubit>(context);
  final TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
