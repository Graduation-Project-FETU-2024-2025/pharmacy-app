import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/widgets/error_api_widget.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/view_models/cubit/get_branch_products_cubit.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/views/widgets/loading_state_widget.dart';
import 'package:pharmacy_app/generated/l10n.dart';

import '../../../../../core/widgets/medicine_card.dart';

class AllMedicinesGridview extends StatelessWidget {
  const AllMedicinesGridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = GetBranchProductsCubit.get(context);
    return BlocBuilder<GetBranchProductsCubit, GetBranchProductsState>(
      builder: (context, state) {
        if (state is GetBranchProductsSuccess) {
          if (state.medicines.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noMedicines,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 150 / 157,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  Routing.medicineDetails,
                  arguments: state.medicines[index],
                );
                if (result == true) {
                  cubit.getBranchProducts(branchId: cubit.currentBranchId!);
                }
              },
              child: MedicineCard(
                medicineModel: state.medicines[index],
              ),
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.medicines.length,
          );
        } else if (state is GetBranchProductsFailure) {
          return Center(
            child: ErrorApiWidget(message: state.apiErrorModel.message!),
          );
        } else {
          return LoadingStateWidget();
        }
      },
    );
  }
}
