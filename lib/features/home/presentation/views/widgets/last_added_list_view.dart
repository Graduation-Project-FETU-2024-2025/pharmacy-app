import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/widgets/error_api_widget.dart';
import 'package:pharmacy_app/features/all_medicines/data/models/product_dto_model.dart';
import 'package:pharmacy_app/features/home/data/models/last_added_model.dart';
import 'package:pharmacy_app/features/home/presentation/view_models/cubit/last_added_cubit.dart';
import 'package:pharmacy_app/features/home/presentation/views/widgets/last_added_medicine_card.dart';
import 'package:pharmacy_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LastAddedListView extends StatelessWidget {
  const LastAddedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastAddedCubit, LastAddedState>(
      builder: (context, state) {
        if (state is LastAddedSuccess) {
          if (state.medicines.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noOutOfStock,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: state.medicines.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: getIt<CacheHelper>().getCurrentLanguage() == 'ar'
                      ? 16.w
                      : 0,
                  right: getIt<CacheHelper>().getCurrentLanguage() == 'en'
                      ? 16.w
                      : 0,
                ),
                child: AspectRatio(
                  aspectRatio: 175 / 170,
                  child: LastAddedMedicineCard(
                    medicineModel: state.medicines[index],
                  ),
                ),
              );
            },
          );
        } else if (state is LastAddedFailure) {
          return ErrorApiWidget(
            message: state.errorModel.message!,
          );
        } else {
          return Skeletonizer(
            enabled: true,
            effect: ShimmerEffect(),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: getIt<CacheHelper>().getCurrentLanguage() == 'ar'
                        ? 16.w
                        : 0,
                    right: getIt<CacheHelper>().getCurrentLanguage() == 'en'
                        ? 16.w
                        : 0,
                  ),
                  child: AspectRatio(
                    aspectRatio: 175 / 170,
                    child: LastAddedMedicineCard(
                      medicineModel: LastAddedModel(
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
                        branchName: '',
                      ),
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
