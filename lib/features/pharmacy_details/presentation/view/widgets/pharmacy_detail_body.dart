import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/view/widgets/row_btn.dart';
import '../../../../../core/utils/app_colors.dart';
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
          Text(
            S.of(context).drStonePharmacy,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.black.withOpacity(0.4)),
          ),
          Gap(36.h),
          Text(
            S.of(context).description,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Gap(10.h),
          Text(
            'Welcome to Welcome to Dr. Stone Pharmacy, yourtrustedneighborhood pharmacy dedicated to providingqualityhealthcare uuuuuuuuuuuuservices and products,etgvjkjcjlcklcmxvc,f.,cfv,.nzjnxjznxzncxkldmlkfldfgrpog[phhhhholllmclmlvlcvlsjjajskdlaldslslllkfffffeewetwwwwglkfisiidjsdqpqplkiooplfmfmmkkdkkoooo. ',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.black.withOpacity(0.35)),
          ),
          Gap(20.h),
          Text(
            S.of(context).areaAndPrice,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          DeliveryAreaCard(),
          Gap(35.h),
          Text(
            S.of(context).workingHour,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Gap(20.h),
          WorkingHourDetail(),
          Gap(33.h),
          RowBtn(),
          Gap(42.h),
        ],
      ),
    );
  }
}
