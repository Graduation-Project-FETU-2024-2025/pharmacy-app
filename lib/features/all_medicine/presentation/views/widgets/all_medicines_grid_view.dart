import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/features/all_medicine/data/models/medicine_model.dart';

import '../../../../../core/utils/app_images.dart';
import 'medicine_card.dart';

class AllMedicinesGridview extends StatelessWidget {
  const AllMedicinesGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24.w,
          mainAxisSpacing: 20.h,
          childAspectRatio: 150 / 170),
      itemBuilder: (context, index) => MedicineCard(
        medicineModel: MedicineModel(
          id: 1,
          medicineName: 'أباكافير',
          img: AppImages.imgMedicine,
          form: 'أقراص',
          quantity: 10,
          company: 'pharma',
          description: '',
          price: 90,
          dosage: 0.2,
          dosageForm: 'أقراص',
          activeSubstance: 'بيكلوميثازون',
        ),
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
    );
  }
}
