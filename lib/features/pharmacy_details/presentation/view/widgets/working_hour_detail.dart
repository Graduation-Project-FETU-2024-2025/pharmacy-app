
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_images.dart';

class WorkingHourDetail extends StatelessWidget {
  const WorkingHourDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppImages.workHour),
        Gap(2.w),
        Text('Twenty four hours service !',style: Theme.of(context).textTheme.labelMedium,)
      ],
    );
  }
}