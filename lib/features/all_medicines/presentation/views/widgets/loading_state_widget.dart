import 'package:flutter/material.dart';

import '../../../data/models/medicine_branch_model.dart';
import '../../../data/models/product_dto_model.dart';
import 'all_medicines_grid_view.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AllMedicinesGridview(
      medicines: List.generate(
        4,
        (index) => MedicineBranchModel(
          branchId: '',
          name: 'hjnmvnb',
          systemProductCode: '',
          stock: 0,
          price: 0,
          visibility: true,
          productsDTO: ProductDtoModel(
            code: '',
            arName: 'nbcbvc',
            activePrincipal: 'cxczxz',
            enName: '',
            image:
                'https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg',
            type: '',
            companyName: '',
          ),
        ),
      ),
    );
  }
}
