import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/database/cache/cache_keys.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/features/home/data/models/out_of_stock_model.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class AlmostRunOutCard extends StatelessWidget {
  const AlmostRunOutCard({
    super.key,
    required this.ofStockModel,
  });
  final OutOfStockModel ofStockModel;
  @override
  Widget build(BuildContext context) {
    String lang =
        getIt<CacheHelper>().getString(key: CacheKeys.currentLanguage) ?? 'en';
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      ofStockModel.productsDTO.image,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: 24.w,
                    start: 24.w,
                  ),
                  child: Text(
                    lang == 'ar'
                        ? ofStockModel.productsDTO.arName
                        : ofStockModel.productsDTO.enName,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: lang == 'en' ? 24.w : 8.w,
                    right: lang == 'ar' ? 24.w : 8.w,
                  ),
                  child: Row(
                    children: [
                      Text('${ofStockModel.price}\$',
                          style: Theme.of(context).textTheme.labelSmall),
                      Spacer(),
                      Container(
                        width: 34.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.red.withOpacity(0.2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.imgAlarm,
                              width: 10.w,
                              height: 10.h,
                            ),
                            SizedBox(width: 3.w),
                            Text(
                              ofStockModel.stock.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Color(0xffFA0909),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 24.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppImages.imgBranch,
                        width: 12.w,
                        height: 12.h,
                      ),
                      SizedBox(width: 2),
                      Text(
                        ofStockModel.branchName,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
