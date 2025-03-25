import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingBranches extends StatelessWidget {
  const ShimmerLoadingBranches({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
    itemCount: 5, 
    itemBuilder: (context, index) {
      return Padding(
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
      );
    },
  );
  }
} 