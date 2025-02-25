import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class AlmostRunOutCard extends StatelessWidget {
  const AlmostRunOutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(AppImages.imgMedicine),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getIt<CacheHelper>().getCurrentLanguage() == 'en'
                        ? 24.w
                        : 0,
                    right: getIt<CacheHelper>().getCurrentLanguage() == 'ar'
                        ? 24.w
                        : 0,
                  ),
                  child: Text(
                    'Abacavir',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getIt<CacheHelper>().getCurrentLanguage() == 'en'
                        ? 24.w
                        : 8.w,
                    right: getIt<CacheHelper>().getCurrentLanguage() == 'ar'
                        ? 24.w
                        : 8.w,
                  ),
                  child: Row(
                    children: [
                      Text(r'90$',
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
                              '5',
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
                // Padding(
                //   padding: EdgeInsets.only(
                //     left: getIt<CacheHelper>().getCurrentLanguage() == 'en'
                //         ? 24.w
                //         : 0,
                //     right: getIt<CacheHelper>().getCurrentLanguage() == 'ar'
                //         ? 24.w
                //         : 0,
                //   ),
                //   child: Text(
                //     'Dr.Stone | Elstad',
                //     style: Theme.of(context).textTheme.displaySmall,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
