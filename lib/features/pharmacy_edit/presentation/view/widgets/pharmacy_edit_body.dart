
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view/widgets/pharmacy_edit_img.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../all_branches/data/models/pharmacy_branch_model.dart';
import 'custom_edit_list.dart';

class PharmacyEditBody extends StatelessWidget {
  const PharmacyEditBody({super.key, required this.branch});
  final PharmacyBranchModel? branch;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PharmacyEditImg(pharmacyImg: branch?.image),
          CustomEditList(branch : branch),
          Center(
            child: SizedBox(
            width: 120.w,
            height: 36.h,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(AppColors.primaryColor),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: () {},//TODO
              child: Text(
                'Save',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 18, color: AppColors.white),
              ),
            ),
                    ),
          ),
          Gap(35.h)
        ],
      ),
    );
  }
}
