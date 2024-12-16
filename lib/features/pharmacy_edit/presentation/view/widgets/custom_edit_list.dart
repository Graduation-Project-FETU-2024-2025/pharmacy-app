import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/widgets/custom_edit_text_form_field.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';

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
            Text('Pharmacy Name', style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).pharmacyNameController,
              hintTxt: 'Pharmacy Name',
            ),
            Gap(31.h),
            Text('Branch Name', style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).branchNameController,
              hintTxt: 'Branch Name',
            ),
            Gap(31.h),
            Text('Description', style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).descController,
              hintTxt: 'Description',
              maxLines: 5,
            ),
            Gap(31.h),
            Text('Delivery man name',
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).manNameController,
              hintTxt: 'Delivery man name',
            ),
            Gap(31.h),
            Text('Phone Number', style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).phoneController,
              hintTxt: 'Phone Number',
            ),
            Gap(31.h),
            Text('Mileage', style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).mileageController,
              hintTxt: 'Mileage',
            ),
            Gap(31.h),
            Text('Lowest price', style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).lowestPriceController,
              hintTxt: 'Lowest price',
            ),
            Gap(31.h),
            Text('Working Hours', style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).workHourController,
              hintTxt: 'Working Hours',
            ),
            Gap(31.h),
            Text('Branch Status', style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).branchStatusController,
              hintTxt: 'Branch Status',
            ),
            Gap(31.h),
          ],
        ),
      ),
    );
  }
}
