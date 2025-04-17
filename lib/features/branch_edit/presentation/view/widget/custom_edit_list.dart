import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/features/all_branches/data/models/pharmacy_branch_model.dart';
import 'package:pharmacy_app/features/add_branch/presentation/view/widgets/get_lat_and_long.dart';
import 'package:pharmacy_app/features/add_branch/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';
import 'package:pharmacy_app/features/branch_edit/presentation/view/widget/custom_delivery_info.dart';
import 'package:pharmacy_app/generated/l10n.dart';
import '../../../../add_branch/presentation/view/widgets/delivery_status_field.dart';
import '../../../../add_branch/presentation/view/widgets/working_hour_widget.dart';
import 'custom_edit_address.dart';
import 'custom_edit_branch_name.dart';

class CustomEditList extends StatelessWidget {
  const CustomEditList({super.key, this.branch});
  final PharmacyBranchModel? branch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
        key: PharmacyEditCubit.get(context).formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomEditBranchName(
                arBranchName: branch?.aRBranchName,
                enBranchName: branch?.eNBranchName),
            Gap(31.h),
            CustomEditAddress(
                aRAddress: branch?.aRAddress, eNAddress: branch?.eNAddress),
            Gap(31.h),
            CustomDeliveryInfo(
                deliveryRange: branch?.deliveryRange.toString(),
                phoneNumber: branch?.phoneNumber,
                pricePerKilo: branch?.pricePerKilo.toString(),
                minDeliveryPrice: branch?.minDeliveryPrice.toString()),
            Gap(31.h),
            WorkingHourWidget(
                start: branch?.workingHours.first.start,
                end: branch?.workingHours.first.end),
            Gap(31.h),
            Text(S.of(context).branchStatus,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            DeliveryStatusField(
              controller: PharmacyEditCubit.get(context).branchStatusController,
              status: branch?.status,
            ),
            Gap(31.h),
            GetLatAndLong(
                lat: branch?.lat.toString(), long: branch?.long.toString())
          ],
        ),
      ),
    );
  }
}
