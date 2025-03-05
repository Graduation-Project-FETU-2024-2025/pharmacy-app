import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/features/auth/data/data/otp_sign_in_request_model.dart';

abstract class AuthRepo{
  Future<Either<String, String>> login(String email);
  Future<Either<String, String>> verifyOTP(OtpSignInRequestModel otpSignInRequestModel);
}