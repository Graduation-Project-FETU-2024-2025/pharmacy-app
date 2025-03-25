import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PharmacyDetailShimmer extends StatelessWidget {
  const PharmacyDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 250.h,
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 24.h,
            width: 200.w,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              color: Colors.white,
            ),
            SizedBox(width: 5.w),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 14.h,
                width: 150.w,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 32.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 18.h,
            width: 180.w,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 14.h),
        Container(
          height: 80.h,
          width: double.infinity,
          color: Colors.white,
        ),
        Padding(
        padding: const EdgeInsets.only(bottom: 19.0  , left: 10 , right: 10),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 127.h, 
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),

        Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              color: Colors.white,
            ),
            SizedBox(width: 4.w),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 18.h,
                width: 150.w,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),
        Container(
          height: 30.h,
          width: double.infinity,
          color: Colors.white,
        ),
        SizedBox(height: 33.h),
        Container(
          height: 30.h,
          width: double.infinity,
          color: Colors.white,
        ),
        SizedBox(height: 42.h),
        Center(
          child: Container(
            height: 30.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
