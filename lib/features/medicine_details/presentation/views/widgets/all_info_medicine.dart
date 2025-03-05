import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'medicine_info_widget.dart';

class AllIfoMedicine extends StatelessWidget {
  const AllIfoMedicine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'أباكافير',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          'أقراص - 50 قرص',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.black.withOpacity(0.3),
              ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                r'$ 15.00',
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
                        '40',
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
                      child: LinearProgressIndicator(
                        value: 0.7,
                        color: Color(0xff24B58E),
                        backgroundColor: AppColors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
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
              info: 'أقراص',
            ),
            Spacer(),
            MedicineInfoWidget(
              title: S.of(context).activeSubstance,
              info: 'الايبوبروفين',
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
              info: 'القاهرة، مصر',
            )
          ],
        ),
      ],
    );
  }
}
