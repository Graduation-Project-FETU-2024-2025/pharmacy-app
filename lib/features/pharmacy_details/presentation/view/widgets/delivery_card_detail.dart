import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../generated/l10n.dart';

class DeliveryCardDetail extends StatelessWidget {
  const DeliveryCardDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120.w,
          height: 80.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.deliveryImg), fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 160.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.profilePic,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'Ahmed Mohamed',
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.iconsPhone,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '+20 1553258966',
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.iconsLocation,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '10 ${S.of(context).km}',
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
                    '5 ${S.of(context).pounds}',
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
