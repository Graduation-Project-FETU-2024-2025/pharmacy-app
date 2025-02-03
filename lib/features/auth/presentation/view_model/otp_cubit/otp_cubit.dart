import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/otp_cubit/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  static OtpCubit get(context) => BlocProvider.of<OtpCubit>(context);
  static final int _numberOTP = 6;
  List<TextEditingController> otpControllers =
      List.generate(_numberOTP, (index) => TextEditingController());

  List<FocusNode> otpFocusNodes =
      List.generate(_numberOTP, (index) => FocusNode());

  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  int get numberOfOtp => _numberOTP;
  void nextFiled(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  String? numberValidator(String? p1) {
    if (p1 == null || p1.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  void _disposeTextEditingControllers() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
  }

  void _disposeFocusNodes() {
    for (var focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
  }

  @override
  Future<void> close() {
    _disposeTextEditingControllers();
    _disposeFocusNodes();
    return super.close();
  }
}
