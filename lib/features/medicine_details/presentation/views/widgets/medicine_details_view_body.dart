import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';
import 'package:pharmacy_app/features/medicine_details/data/repos/delete_repo.dart';
import 'package:pharmacy_app/features/medicine_details/presentation/view_models/cubit/delete_cubit.dart';
import 'package:pharmacy_app/features/medicine_details/presentation/views/widgets/delete_button_consumer.dart';

import 'all_info_medicine.dart';

class MedicineDetailsViewBody extends StatelessWidget {
  const MedicineDetailsViewBody({super.key, required this.medicineBranchModel});
  final MedicineBranchModel medicineBranchModel;

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
                    image: CachedNetworkImageProvider(
                      medicineBranchModel.productsDTO.image,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16.h,
            ),
            child: AllIfoMedicine(
              medicineBranchModel: medicineBranchModel,
            ),
          ),
          Spacer(),
          BlocProvider(
            create: (context) => DeleteCubit(
              getIt<DeleteRepo>(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35.h,
                  width: 120.w,
                  child: DeleteButtonConsumer(
                    medicineBranchModel: medicineBranchModel,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
