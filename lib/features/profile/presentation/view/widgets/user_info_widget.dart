
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/features/profile/presentation/view/widgets/custom_profile_image.dart';


class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key, required this.imagePath, required this.name,
  });
  final String imagePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProfileImage(imagePath: imagePath,),
        Gap(25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(AppImages.imgEditName),
            ),
          ],
        ),
      ],
    );
  }
}
