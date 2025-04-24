import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/features/all_branches/data/models/pharmacy_branch_model.dart';
import 'package:pharmacy_app/features/pharmacy_details/data/repo/delete_branch_repo.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/view/widgets/delivery_area_card.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/view/widgets/row_btn.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/view_model/delete_branch/delete_branch_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'working_hour_detail.dart';

class PharmacyDetailBody extends StatelessWidget {
  const PharmacyDetailBody({super.key, required this.branch});
  final PharmacyBranchModel branch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            branch.branchName,
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
                branch.address,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.black.withOpacity(0.4)
                        : AppColors.white.withOpacity(0.4),
                    fontWeight: FontWeight.normal),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Gap(32.h),
          Text(
            S.of(context).deliveryAreaAndPrice,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          DeliveryAreaCard(
              phoneNum: branch.phoneNumber,
              pricePerKilo: branch.pricePerKilo,
              deliveryRange: branch.deliveryRange),
          Gap(34.h),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.hourIcon,
                fit: BoxFit.contain,
                width: 20,
                height: 20,
              ),
              Gap(4.w),
              Text(
                S.of(context).workingHour,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Gap(14.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: WorkingHourDetail(workingHour: branch.workingHours),
          ),
          Gap(33.h),
          BlocProvider(
            create: (context) => DeleteBranchCubit(getIt<DeleteBranchRepo>()),
            child: RowBtn(branch: branch),
          ),
          Gap(42.h),
        ],
      ),
    );
  }
}
