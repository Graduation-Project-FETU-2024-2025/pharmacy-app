import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/widgets/custom_edit_text_form_field.dart';
import 'package:pharmacy_app/features/add_branch/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class CustomAddBranchInfo extends StatelessWidget {
  const CustomAddBranchInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).enBranchName,
            style: Theme.of(context).textTheme.labelMedium),
        Gap(18.h),
        CustomEditTextFormField(
          controller: PharmacyEditCubit.get(context).enBranchNameController,
          hintTxt: S.of(context).enBranchName,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).pleaseEnterEnBranchName;
            }
            return null;
          },
        ),
        Gap(31.h),

        Text(S.of(context).arBranchName,
            style: Theme.of(context).textTheme.labelMedium),
        Gap(18.h),
        CustomEditTextFormField(
          controller: PharmacyEditCubit.get(context).arBranchNameController,
          hintTxt: S.of(context).arBranchName,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).pleaseEnterArBranchName;
            }
            return null;
          },
        ),
        Gap(31.h),

        Text(S.of(context).arAddress,
            style: Theme.of(context).textTheme.labelMedium),
        Gap(18.h),
        CustomEditTextFormField(
          controller: PharmacyEditCubit.get(context).arAddressController,
          hintTxt: S.of(context).address,
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
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).pleaseEnterEnAddress;
            }
            return null;
          },
        ),
      ],
    );
  }
}
