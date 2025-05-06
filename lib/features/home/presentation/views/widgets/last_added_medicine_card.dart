import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/features/home/data/models/last_added_model.dart';

import '../../../../../core/utils/app_colors.dart';

class LastAddedMedicineCard extends StatelessWidget {
  const LastAddedMedicineCard({
    super.key,
    required this.medicineModel,
  });

  final LastAddedModel medicineModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.white
            : AppColors.darkWhite,
        border: Border.all(
          color: Color(0xffB3B3B3),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
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
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getIt<CacheHelper>().getCurrentLanguage() == 'ar'
                                  ? medicineModel.productsDTO.arName
                                  : medicineModel.productsDTO.enName,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              medicineModel.productsDTO.activePrincipal,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? AppColors.black.withOpacity(0.6)
                                        : AppColors.white.withOpacity(0.6),
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
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.imgBranch,
                          width: 12.w,
                          height: 12.h,
                        ),
                        SizedBox(width: 2),
                        Text(
                          medicineModel.branchName,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
