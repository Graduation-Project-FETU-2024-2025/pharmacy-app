import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/widgets/custom_edit_text_form_field.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view/widgets/get_lat_and_long.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';
import 'package:pharmacy_app/generated/l10n.dart';
import 'delivery_status_field.dart';
import 'working_hour_widget.dart';

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
            Text(S.of(context).branchName,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).branchNameController,
              hintTxt: S.of(context).branchName,
            ),
            Gap(31.h),
            Text(S.of(context).pricePerKilo,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).pricePerKilo,
              hintTxt: S.of(context).pricePerKilo,
            ),
            Gap(31.h),
            Text(S.of(context).phoneNum,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).phoneController,
              hintTxt: S.of(context).phoneNum,
            ),
            Gap(31.h),
            Text(S.of(context).deliveryRange,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).deliveryRange,
              hintTxt: S.of(context).deliveryRange,
            ),
            Gap(31.h),
            Text(S.of(context).lowestPrice,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).lowestPriceController,
              hintTxt: S.of(context).lowestPrice,
            ),
            Gap(31.h),
            WorkingHourWidget(),
            Gap(31.h),
            Text(S.of(context).branchStatus,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            DeliveryStatusField(controller: TextEditingController(),),
            Gap(31.h),
            GetLatAndLong()
          ],
        ),
      ),
    );
  }
}