import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/views/widgets/system_medicine_grid_view.dart';

import '../../../../../core/widgets/search_text_field.dart';

class SystemMedicineViewBody extends StatelessWidget {
  const SystemMedicineViewBody({super.key, required this.branchId});
  final String branchId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.0.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SearchTextField(),
            SizedBox(height: 60.h),
            SystemMedicineGridView(
              branchId: branchId,
            ),
          ],
        ),
      ),
    );
  }
}
