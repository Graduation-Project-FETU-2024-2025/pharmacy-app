import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../add_branch/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';

class CustomDeliveryInfo extends StatelessWidget {
  const CustomDeliveryInfo({super.key, this.pricePerKilo, this.phoneNumber, this.deliveryRange, this.minDeliveryPrice});
  final String? pricePerKilo;
  final String? phoneNumber;
  final String? deliveryRange;
  final String? minDeliveryPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).pricePerKilo,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).pricePerKilo,
              hintTxt: S.of(context).pricePerKilo,
              initialVal: pricePerKilo,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).enterPricePerKilo;
                }
                if (double.tryParse(value) == null) {
                  return S.of(context).enterValidNumber;
                }
                return null;
              },
            ),
            Gap(31.h),
            Text(S.of(context).phoneNum,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).phoneController,
              hintTxt: S.of(context).phoneNum,
              initialVal: phoneNumber,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).enterPhoneNumber;
                }
                if (!value.isValidPhone) {
                  return S.of(context).invalidPhoneNumber;
                }
                return null;
              },
            ),
            Gap(31.h),
            Text(S.of(context).deliveryRange,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).deliveryRange,
              hintTxt: S.of(context).deliveryRange,
              initialVal: deliveryRange,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).enterDeliveryRange;
                }
                if (double.tryParse(value) == null) {
                  return S.of(context).enterValidNumber;
                }
                return null;
              },
            ),
            Gap(31.h),
            Text(S.of(context).lowestPrice,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).lowestPriceController,
              hintTxt: S.of(context).lowestPrice,
              initialVal: minDeliveryPrice,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).enterMinDeliveryPrice;
                }
                if (double.tryParse(value) == null) {
                  return S.of(context).enterValidNumber;
                }
                return null;
              },
            ),
      ],
    );
  }
}