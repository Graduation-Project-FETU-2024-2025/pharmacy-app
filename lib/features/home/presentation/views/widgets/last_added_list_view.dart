import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/medicine_card.dart';
import '../../../data/models/medicine_model.dart';

class LastAddedListView extends StatelessWidget {
  const LastAddedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            left: getIt<CacheHelper>().getCurrentLanguage() == 'ar' ? 16.w : 0,
            right: getIt<CacheHelper>().getCurrentLanguage() == 'en' ? 16.w : 0,
          ),
          child: MedicineCard(
            medicineModel: MedicineModel(
              id: 1,
              medicineName: 'Abacavir',
              img: AppImages.imgMedicine,
              form: 'أقراص',
              quantity: 10,
              company: 'pharma',
              description: '',
              price: 90,
              dosage: 0.2,
              dosageForm: 'أقراص',
              activeSubstance: 'Beclomethasone',
            ),
          ),
        );
      },
    );
  }
}
