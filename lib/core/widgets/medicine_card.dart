import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';

import '../../../../../core/utils/app_colors.dart';
import '../database/cache/cashe_helper.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({
    super.key,
    required this.medicineModel,
  });

  final MedicineBranchModel medicineModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 157 / 150,
      child: Container(
        width: 157,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xffB3B3B3),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      medicineModel.productsDTO.image,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getIt<CacheHelper>().getCurrentLanguage() ==
                                        'ar'
                                    ? medicineModel.productsDTO.arName
                                    : medicineModel.productsDTO.enName,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                medicineModel.productsDTO.activePrincipal,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColors.black.withOpacity(0.6),
                                    ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            '${medicineModel.price}\$',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      // Spacer(),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Image.asset(
                      //       AppImages.imgBranch,
                      //       width: 12.w,
                      //       height: 12.h,
                      //     ),
                      //     SizedBox(width: 2),
                      //     Text(
                      //       'Dr.Stone | Elstad',
                      //       style: Theme.of(context).textTheme.displaySmall,
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
