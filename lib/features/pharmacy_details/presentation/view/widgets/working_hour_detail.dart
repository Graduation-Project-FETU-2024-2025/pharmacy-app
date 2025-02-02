
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WorkingHourDetail extends StatelessWidget {
  const WorkingHourDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('10:00 Am',style: Theme.of(context).textTheme.labelMedium),
        Gap(20.w),
        Text('-',style: Theme.of(context).textTheme.labelMedium),
        Gap(20.w),
        Text('12:00 PM',style: Theme.of(context).textTheme.labelMedium,),
      ],
    );
  }
}