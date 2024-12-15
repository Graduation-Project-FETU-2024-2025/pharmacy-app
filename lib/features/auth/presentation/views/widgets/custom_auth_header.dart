
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';


class CustomAuthHeader extends StatelessWidget {
  const CustomAuthHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(65),
      width: double.infinity,
      color: AppColors.primaryColor,
      child: Image.asset(
        AppImages.imgAuthHeader,
        height: 150,
      ),
    );
  }
}
