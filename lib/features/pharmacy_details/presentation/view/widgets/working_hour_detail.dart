
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/features/all_branches/data/data/working_hours_model.dart';



class WorkingHourDetail extends StatelessWidget {
  const WorkingHourDetail({super.key, required this.workingHour});
  final List<WorkingHours> workingHour;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(workingHour.first.start,style: Theme.of(context).textTheme.bodySmall),
        Gap(5.w),
        Text('-',style: Theme.of(context).textTheme.bodySmall),
        Gap(5.w),
        Text(workingHour.first.end,style: Theme.of(context).textTheme.bodySmall,),
      ],
    );
  }
}