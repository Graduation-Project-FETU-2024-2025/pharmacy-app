import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/auth/presentation/views/widgets/decorated_auth_body.dart';
import 'package:pharmacy_app/features/auth/presentation/views/widgets/otp_body.dart';
import 'package:pharmacy_app/features/auth/presentation/views/widgets/sign_in_header.dart';


class OTPView extends StatelessWidget {
  const OTPView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedAuthBody(
        headerWidget: SignInHeader(
          canBack: true,
        ),
        bodyWidget: OTPBody(email: email,),
      ),
    );
  }
}
