import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/database/cache/cache_keys.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/database/cache/cashe_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'medicine_info_widget.dart';

class AllIfoMedicine extends StatelessWidget {
  const AllIfoMedicine({
    super.key,
    required this.medicineBranchModel,
  });
  final MedicineBranchModel medicineBranchModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getIt.get<CacheHelper>().getString(key: CacheKeys.currentLanguage) == 'en'
              ? medicineBranchModel.productsDTO.enName
              : medicineBranchModel.productsDTO.arName,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                ' ${medicineBranchModel.price}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Spacer(),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        medicineBranchModel.stock.toString(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        width: 5.h,
                      ),
                      Text(
                        S.of(context).inStock,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Transform.rotate(
                    angle: 180 * 3.14 / 180,
                    child: SizedBox(
                      height: 10.h,
                      child: Skeleton.shade(
                        child: LinearProgressIndicator(
                          value: medicineBranchModel.stock < 5 ? 0.25 : 0.75,
                          color: medicineBranchModel.stock < 5
                              ? Colors.red
                              : Color(0xff24B58E),
                          backgroundColor: AppColors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            MedicineInfoWidget(
              title: S.of(context).DoageForm,
              info: medicineBranchModel.productsDTO.type,
            ),
            Spacer(),
            MedicineInfoWidget(
              title: S.of(context).activeSubstance,
              info: medicineBranchModel.productsDTO.activePrincipal,
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MedicineInfoWidget(
              title: S.of(context).manufacturer,
              info: medicineBranchModel.productsDTO.companyName,
            )
          ],
        ),
      ],
    );
  }
}
