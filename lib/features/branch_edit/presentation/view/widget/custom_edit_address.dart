import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../add_branch/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';

class CustomEditAddress extends StatelessWidget {
  const CustomEditAddress({super.key, this.aRAddress, this.eNAddress});
  final String? aRAddress;
  final String? eNAddress;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).arAddress,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).arAddressController,
              hintTxt: S.of(context).address,
              initialVal: aRAddress== "null"?"":aRAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).pleaseEnterArAddress;
                }
                return null;
              },
            ),
            Gap(31.h),
            Text(S.of(context).enAddress,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            CustomEditTextFormField(
              controller: PharmacyEditCubit.get(context).enAddressController,
              hintTxt: S.of(context).address,
              initialVal: eNAddress == "null"?"":eNAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).pleaseEnterEnAddress;
                }
                return null;
              },
            )
      ],
    );
  }
}