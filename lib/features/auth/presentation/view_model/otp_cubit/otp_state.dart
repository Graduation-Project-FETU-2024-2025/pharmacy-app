
sealed class OtpState {}

final class OtpInitial extends OtpState {}

final class OtpCheckLoading extends OtpState {}

final class OtpCheckSuccess extends OtpState {}

final class OtpCheckFailure extends OtpState {
  final String message;
  OtpCheckFailure(this.message);
}




