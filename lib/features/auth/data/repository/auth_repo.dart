import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/auth/data/data/otp_sign_in_request_model.dart';

abstract class AuthRepo{
  Future<Either<ApiErrorModel, String>> login(String email);
  Future<Either<ApiErrorModel, String>> verifyOTP(OtpSignInRequestModel otpSignInRequestModel);
}