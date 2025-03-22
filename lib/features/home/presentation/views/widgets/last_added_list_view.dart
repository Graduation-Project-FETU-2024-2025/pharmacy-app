import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/medicine_branch_model.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/product_dto_model.dart';

import '../../../../../core/widgets/medicine_card.dart';

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
            medicineModel: MedicineBranchModel(
              branchId: 'sm,ca',
              name: ',fmdnv,d',
              systemProductCode: '',
              stock: 0,
              price: 0,
              visibility: true,
              productsDTO: ProductDtoModel(
                code: '',
                arName: 'نيىؤنلان',
                enName: "kccjskb",
                image:
                    'https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg',
                type: 'cnjk',
                activePrincipal: 'cmdjcc',
                companyName: 'cjdsbcsdjh',
              ),
            ),
          ),
        );
      },
    );
  }
}
