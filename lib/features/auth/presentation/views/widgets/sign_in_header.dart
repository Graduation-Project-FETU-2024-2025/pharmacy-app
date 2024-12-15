
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.imgAuthHeader,
      height: 150,
    );
  }
}
