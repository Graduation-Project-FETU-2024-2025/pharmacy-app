import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/features/profile/presentation/view/widgets/profile_option_container.dart';
import 'package:pharmacy_app/features/profile/presentation/view/widgets/user_info_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              UserInfoWidget(
                imagePath: AppImages.imgMap,
                name: 'Ahmed Mohamed',
              ),
              Gap(30.h),
              ProfileOptionContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
