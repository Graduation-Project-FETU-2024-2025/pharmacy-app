import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/widgets/error_api_widget.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/product_dto_model.dart';
import 'package:pharmacy_app/features/home/data/models/out_of_stock_model.dart';
import 'package:pharmacy_app/features/home/presentation/view_models/out_of_stock_cubit/out_of_stock_cubit.dart';
import 'package:pharmacy_app/features/home/presentation/views/widgets/almostRunOutCard.dart';
import 'package:pharmacy_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_images.dart';

class AlmostRunOutGrid extends StatelessWidget {
  const AlmostRunOutGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutOfStockCubit, OutOfStockState>(
      builder: (context, state) {
        if (state is OutOfStockSuccess) {
          if (state.medicines.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Image.asset(
                    AppImages.newNoData,
                  ),
                  Text(
                    S.of(context).noOutOfStock,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            );
          }
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.medicines.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 157 / 179,
            ),
            itemBuilder: (context, index) {
              return AlmostRunOutCard(
                ofStockModel: state.medicines[index],
              );
            },
          );
        } else if (state is OutOfStockFailure) {
          return ErrorApiWidget(
            message: state.errorModel.message!,
          );
        } else {
          return Skeletonizer(
            enabled: true,
            effect: ShimmerEffect(),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 157 / 179,
              ),
              itemBuilder: (context, index) {
                return AlmostRunOutCard(
                  ofStockModel: OutOfStockModel(
                    branchId: '',
                    branchName: '',
                    name: '',
                    systemProductCode: '',
                    stock: 0,
                    price: 0,
                    visibility: true,
                    productsDTO: ProductDtoModel(
                      code: '',
                      arName: 'cnmdv',
                      enName: 'vmd,v',
                      image:
                          'https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg',
                      type: 'ndm,vn',
                      activePrincipal: 'm,dv',
                      companyName: 'dnmv',
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
