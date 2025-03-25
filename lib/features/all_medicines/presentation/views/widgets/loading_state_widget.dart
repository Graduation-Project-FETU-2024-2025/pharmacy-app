import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/widgets/medicine_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/models/medicine_branch_model.dart';
import '../../../data/models/product_dto_model.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(),
      enabled: true,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24.w,
          mainAxisSpacing: 20.h,
          childAspectRatio: 150 / 157,
        ),
        itemBuilder: (context, index) => MedicineCard(
          medicineModel: MedicineBranchModel(
            branchId: '',
            name: '',
            systemProductCode: '',
            stock: 0,
            price: 0,
            visibility: true,
            productsDTO: ProductDtoModel(
              code: '',
              arName: '',
              enName: '',
              image:
                  'https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg',
              type: '',
              activePrincipal: 'activePrincipal',
              companyName: 'companyName',
            ),
          ),
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
      ),
    );
  }
}
