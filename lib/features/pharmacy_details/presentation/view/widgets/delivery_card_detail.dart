import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../generated/l10n.dart';

class DeliveryCardDetail extends StatelessWidget {
  const DeliveryCardDetail(
      {super.key,
      required this.phoneNum,
      required this.pricePerKilo,
      required this.deliveryRange});
  final String phoneNum;
  final double pricePerKilo;
  final int deliveryRange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 334.w,
      height: 116.h,
      child: Row(
        children: [
          Container(
            width: 119.w,
            height: 80.h,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                AppImages.deliveryImg,
              ),
              fit: BoxFit.cover,
            )),
          ),
          SizedBox(
            width: 160.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.iconsPhone,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      phoneNum,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.iconsLocation,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '$deliveryRange KM',
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 10.w),
                    SvgPicture.asset(
                      AppIcons.iconsMoney,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '$pricePerKilo ${S.of(context).pounds}',
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
