
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DecoratedAuthBody extends StatelessWidget {
  const DecoratedAuthBody({
    super.key, required this.headerWidget, required this.bodyWidget,
  });
  final Widget headerWidget;
  final Widget bodyWidget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
        ),
        Container(
          padding: const EdgeInsets.all(65),
          width: double.infinity,
          color: AppColors.primaryColor,
          child: headerWidget,
        ),
        Positioned(
          top: 200.h,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height - 200.h,
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: bodyWidget,
          ),
        ),
      ],
    );
  }
}
