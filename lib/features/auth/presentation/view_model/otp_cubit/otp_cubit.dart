import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/auth/data/data/otp_sign_in_request_model.dart';
import 'package:pharmacy_app/features/auth/data/repository/auth_repo.dart';
import 'package:pharmacy_app/features/auth/presentation/view_model/otp_cubit/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this._authRepo) : super(OtpInitial());
  final AuthRepo _authRepo;
  static OtpCubit get(context) => BlocProvider.of<OtpCubit>(context);
  static final int _numberOTP = 4;
  List<TextEditingController> otpControllers =
      List.generate(_numberOTP, (index) => TextEditingController());

  List<FocusNode> otpFocusNodes =
      List.generate(_numberOTP, (index) => FocusNode());
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  void submitOtp(String email) async {
    emit(OtpCheckLoading());
    String otp = '';
    for (var element in otpControllers) {
      otp += element.text;
    }
    final result = await _authRepo
        .verifyOTP(OtpSignInRequestModel(email: email, otp: otp));
    result.fold(
      (apiErrorModel) => emit(OtpCheckFailure(apiErrorModel: apiErrorModel)),
      (r) => emit(OtpCheckSuccess()),
    );
  }

  void resendOTP(String email) async {
    emit(ResendOTPLoading());
    final result = await _authRepo.login(email);
    result.fold(
      (apiErrorModel) => emit(ResendOTPFailure(apiErrorModel: apiErrorModel)),
      (r) => emit(ResendOTPSuccess()),
    );
  }

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
