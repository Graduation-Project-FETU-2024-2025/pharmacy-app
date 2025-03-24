import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/widgets/custom_edit_text_form_field.dart';
import 'package:pharmacy_app/features/all_branches/data/models/pharmacy_branch_model.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view/widgets/get_lat_and_long.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';
import 'package:pharmacy_app/generated/l10n.dart';
import 'delivery_status_field.dart';
import 'working_hour_widget.dart';

class CustomEditList extends StatelessWidget {
  const CustomEditList({super.key, required this.branch});
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
            Text(S.of(context).enBranchName,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).enBranchNameController,
              hintTxt: S.of(context).enBranchName,
              initialVal: branch?.branchName,
            ),
            Gap(31.h),
            Text(S.of(context).arBranchName,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).arBranchNameController,
              hintTxt: S.of(context).arBranchName,
              initialVal: branch?.branchName,
            ),
            Gap(31.h),
            Text(S.of(context).pricePerKilo,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).pricePerKilo,
              hintTxt: S.of(context).pricePerKilo,
              initialVal: branch?.pricePerKilo.toString(),
            ),
            Gap(31.h),
            Text(S.of(context).phoneNum,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).phoneController,
              hintTxt: S.of(context).phoneNum,
              initialVal: branch?.phoneNumber,
            ),
            Gap(31.h),
            Text(S.of(context).deliveryRange,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).deliveryRange,
              hintTxt: S.of(context).deliveryRange,
              initialVal: branch?.deliveryRange.toString(),
            ),
            Gap(31.h),
            Text(S.of(context).lowestPrice,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).lowestPriceController,
              hintTxt: S.of(context).lowestPrice,
              initialVal: branch?.minDeliveryPrice.toString(),
            ),
            Gap(31.h),
            WorkingHourWidget(start:  branch?.workingHours.first.start , end : branch?.workingHours.first.end),
            Gap(31.h),
            Text(S.of(context).branchStatus,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            DeliveryStatusField(
              controller: PharmacyEditCubit.get(context).branchStatusController,
              status: branch?.status,
              ),
            Gap(31.h),
            GetLatAndLong(lat : branch?.lat.toString(), long : branch?.long.toString())
          ],
        ),
      ),
    );
  }
}