import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/widgets/custom_edit_text_form_field.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class CustomEditList extends StatelessWidget {
  const CustomEditList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
        key: PharmacyEditCubit.get(context).formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).pharmacyName, style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).pharmacyNameController,
              hintTxt: S.of(context).pharmacyName,
            ),
            Gap(31.h),
            Text(S.of(context).branchName, style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).branchNameController,
              hintTxt: S.of(context).branchName,
            ),
            Gap(31.h),
            Text(S.of(context).description, style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).descController,
              hintTxt: S.of(context).description,
              maxLines: 5,
            ),
            Gap(31.h),
            Text(S.of(context).deliveryMan,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).manNameController,
              hintTxt: S.of(context).deliveryMan,
            ),
            Gap(31.h),
            Text(S.of(context).phoneNum, style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).phoneController,
              hintTxt: S.of(context).phoneNum,
            ),
            Gap(31.h),
            Text(S.of(context).mileage, style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).mileageController,
              hintTxt: S.of(context).mileage,
            ),
            Gap(31.h),
            Text(S.of(context).lowestPrice, style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).lowestPriceController,
              hintTxt: S.of(context).lowestPrice,
            ),
            Gap(31.h),
            Text(S.of(context).workingHour, style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).workHourController,
              hintTxt: S.of(context).workingHour,
            ),
            Gap(31.h),
            Text(S.of(context).branchStatus, style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).branchStatusController,
              hintTxt: S.of(context).branchStatus,
            ),
            Gap(31.h),
          ],
        ),
      ),
    );
  }
}
