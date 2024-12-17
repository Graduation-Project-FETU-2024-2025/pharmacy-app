import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/widgets/add_delete_button.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../generated/l10n.dart';
import 'all_info_medicine.dart';

class MedicineDetailsViewBody extends StatelessWidget {
  const MedicineDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              getIt<CacheHelper>().getCurrentLanguage() == 'ar'
                  ? Positioned(
                      top: 16.h,
                      left: 16.w,
                      child: SvgPicture.asset(
                        AppIcons.iconsBack,
                      ),
                    )
                  : Positioned(
                      top: 16.h,
                      right: 16.w,
                      child: SvgPicture.asset(
                        AppIcons.iconsBackRight,
                      ),
                    ),
              Positioned(
                bottom: 35.h,
                left: MediaQuery.sizeOf(context).width * 0.38.w,
                child: Container(
                  width: 80.w,
                  height: 10,
                  decoration: ShapeDecoration(
                    color: AppColors.black.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 360.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppImages.imgMedDetail,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: AllIfoMedicine(),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.h,
                width: 120.w,
                child: AddDeleteButton(
                  title: S.of(context).delete,
                  color: AppColors.red,
                  onpressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
