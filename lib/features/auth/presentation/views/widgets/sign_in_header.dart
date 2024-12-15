import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
    this.canBack = false,
  });
  final bool canBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        canBack
            ? IconButton(
                icon: SvgPicture.asset(
                  AppIcons.iconsBack,
                  height: 50,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : SizedBox(),
        Spacer(),
        Image.asset(
          AppImages.imgAuthHeader,
          height: 150,
        ),
        Spacer(),
      ],
    );
  }
}
