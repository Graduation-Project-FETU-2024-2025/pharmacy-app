import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/view/widgets/row_btn.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../generated/l10n.dart';
import 'delivery_area_card.dart';
import 'working_hour_detail.dart';

class PharmacyDetailBody extends StatelessWidget {
  const PharmacyDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 29, right: 29, top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).drStonePharmacy.substring(0, 18),
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 24),
          ),
          Gap(10.h),
          Row(
                    children: [
                      SvgPicture.asset(
                    AppIcons.iconsLocation,
                    fit: BoxFit.contain,
                    width: 20,
                    height: 20,
                  ),
                      SizedBox(width: 5),
                      Text(
                        S.of(context).locateEgTanEstad,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black.withOpacity(0.4)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
          Gap(32.h),
          Text(
            'Delivery Area & Price',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          DeliveryAreaCard(),
          Gap(34.h),
          Text(
            'Working Hours',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Gap(14.h),
          WorkingHourDetail(),
          Gap(33.h),
          RowBtn(),
          Gap(42.h),
        ],
      ),
    );
  }
}
