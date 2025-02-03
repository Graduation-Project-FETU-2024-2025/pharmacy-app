import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
    this.canBack = false,
  });
  final bool canBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        canBack
            ? IconButton(
                icon: SvgPicture.asset(
                  AppIcons.iconsBack,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : SizedBox.shrink(),

        Image.asset(
          AppImages.imgAuthHeader,
          height: 100.h,
        ),
        // Spacer(),
      ],
    );
  }
}
