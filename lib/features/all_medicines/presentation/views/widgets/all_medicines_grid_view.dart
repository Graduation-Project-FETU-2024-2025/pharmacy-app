import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';

import '../../../../../core/widgets/medicine_card.dart';

class AllMedicinesGridview extends StatelessWidget {
  const AllMedicinesGridview({super.key, required this.medicines});
  final List<MedicineBranchModel> medicines;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 150 / 157,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          Routing.medicineDetails,
          arguments: medicines[index],
        ),
        child: MedicineCard(
          medicineModel: medicines[index],
        ),
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: medicines.length,
    );
  }
}
