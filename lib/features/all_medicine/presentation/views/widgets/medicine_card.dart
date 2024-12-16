import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/all_medicine/data/models/medicine_model.dart';

import '../../../../../core/utils/app_colors.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key, required this.medicineModel});

  final MedicineModel medicineModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffB3B3B3),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    medicineModel.img,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          medicineModel.medicineName,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          medicineModel.activeSubstance,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.black.withOpacity(0.6),
                                  ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '${medicineModel.price}\$',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
