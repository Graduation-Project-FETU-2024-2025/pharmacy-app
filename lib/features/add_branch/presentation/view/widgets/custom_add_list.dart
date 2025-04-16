import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/features/add_branch/presentation/view/widgets/get_lat_and_long.dart';
import 'package:pharmacy_app/features/add_branch/presentation/view_model/pharmacy_Edit_cubit/pharmacy_edit_cubit.dart';
import 'package:pharmacy_app/generated/l10n.dart';
import '../../../../add_branch/presentation/view/widgets/delivery_status_field.dart';
import '../../../../add_branch/presentation/view/widgets/working_hour_widget.dart';
import 'custom_add_branch_info.dart';
import 'custom_delivery_info_fields.dart';

class CustomAddList extends StatelessWidget {
  const CustomAddList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
        key: PharmacyEditCubit.get(context).formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAddBranchInfo(),
            Gap(31.h),
            CustomDeliveryInfoFields(),
            Gap(31.h),
            WorkingHourWidget(),
            Gap(31.h),
            Text(S.of(context).branchStatus,
                style: Theme.of(context).textTheme.labelMedium),
            Gap(18.h),
            DeliveryStatusField(
                controller:
                    PharmacyEditCubit.get(context).branchStatusController),
            Gap(31.h),
            GetLatAndLong()
          ],
        ),
      ),
    );
  }
}
