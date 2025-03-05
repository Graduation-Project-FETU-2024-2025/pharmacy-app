
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/features/pharmacy_edit/presentation/view/widgets/pharmacy_edit_img.dart';

import '../../../../../core/utils/app_colors.dart';
import 'custom_edit_list.dart';

class PharmacyEditBody extends StatelessWidget {
  const PharmacyEditBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PharmacyEditImg(pharmacyImg: AppImages.pharmacyDetailImg),
          CustomEditList(),
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
