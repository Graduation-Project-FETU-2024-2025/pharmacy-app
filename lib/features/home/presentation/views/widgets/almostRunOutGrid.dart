import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/features/home/presentation/views/widgets/almostRunOutCard.dart';

class AlmostRunOutGrid extends StatelessWidget {
  const AlmostRunOutGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24.w,
          mainAxisSpacing: 20.h,
          childAspectRatio: 157 / 198),
      itemBuilder: (context, index) {
        return AlmostRunOutCard();
      },
    );
  }
}
