import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/database/cache/cache_keys.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/core/widgets/search_text_field.dart';
import 'package:pharmacy_app/features/home/presentation/view_models/last_added/last_added_cubit.dart';
import 'package:pharmacy_app/features/home/presentation/view_models/out_of_stock_cubit/out_of_stock_cubit.dart';
import 'package:pharmacy_app/features/home/presentation/views/widgets/almostRunOutGrid.dart';
import 'package:pharmacy_app/features/home/presentation/views/widgets/last_added_section.dart';
import 'package:pharmacy_app/generated/l10n.dart';

import '../../../../../core/database/cache/cashe_helper.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<LastAddedCubit>().getLastAdded();
          context.read<OutOfStockCubit>().getOutOfStock();
        },
        color: AppColors.primaryColor,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 24.h,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15.r,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              '${S.of(context).hi}, ${getIt<CacheHelper>().getString(key: CacheKeys.username) ?? "user"}!',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Spacer(),
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff4169E1).withOpacity(0.2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  AppIcons.iconsCart,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30.h),
                        SearchTextField(
                          onChanged: (p0) => {},
                          onPressed: () => {},
                          controller: TextEditingController(),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 60.w,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: 5.h,
                                ),
                                child: Text(
                                  S.of(context).homeMessage,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? AppColors.black
                                            : AppColors.white,
                                        fontSize: getIt<CacheHelper>()
                                                    .getCurrentLanguage() ==
                                                'ar'
                                            ? 23
                                            : 25,
                                      ),
                                ),
                              ),
                            ),
                            Image.asset(
                              AppImages.imgWelcomeHome,
                              width: 167.w,
                              height: 96.h,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Container(
                          width: double.infinity,
                          height: 120.h,
                          decoration: BoxDecoration(
                            color: Color(0xff4169E1).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: LastAddedSection(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          S.of(context).almostRunOut,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Spacer(),
                        Text(
                          S.of(context).seeAll,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(width: 3.w),
                        getIt<CacheHelper>().getCurrentLanguage() == 'ar'
                            ? Transform.rotate(
                                angle: 180 * 3.14 / 180,
                                child: SvgPicture.asset(
                                  AppIcons.iconsArrowSeeAll,
                                  width: 10,
                                  height: 10,
                                ),
                              )
                            : SvgPicture.asset(
                                AppIcons.iconsArrowSeeAll,
                                width: 10,
                                height: 10,
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                child: AlmostRunOutGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
