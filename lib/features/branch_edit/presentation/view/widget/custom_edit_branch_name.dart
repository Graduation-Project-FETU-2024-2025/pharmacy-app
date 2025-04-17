
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/custom_edit_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../add_branch/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';

class CustomEditBranchName extends StatelessWidget {
  const CustomEditBranchName({super.key, this.arBranchName, this.enBranchName});
  final String? arBranchName;
  final String? enBranchName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).arBranchName,
            style: Theme.of(context).textTheme.labelMedium),
        Gap(18.h),
        CustomEditTextFormField(
          controller: PharmacyEditCubit.get(context).arBranchNameController,
          hintTxt: S.of(context).branchName,
          initialVal: arBranchName,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).pleaseEnterArBranchName;
            }
            return null;
          },
        ),
        Gap(31.h),
        Text(S.of(context).enBranchName,
            style: Theme.of(context).textTheme.labelMedium),
        Gap(18.h),
        CustomEditTextFormField(
          controller: PharmacyEditCubit.get(context).enBranchNameController,
          hintTxt: S.of(context).branchName,
          initialVal: enBranchName,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).pleaseEnterEnBranchName;
            }
            return null;
          },
        )
      ],
    );
  }
}
