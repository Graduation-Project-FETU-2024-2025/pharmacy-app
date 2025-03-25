import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/widgets/error_api_widget.dart';
import 'package:pharmacy_app/features/add_medicine/data/models/system_medicine_model.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/view_models/cubit/system_medicines_cubit.dart';
import 'package:pharmacy_app/features/add_medicine/presentation/views/widgets/system_medicine_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SystemMedicineGridView extends StatelessWidget {
  const SystemMedicineGridView({
    super.key,
    required this.branchId,
  });
  final String branchId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemMedicinesCubit, SystemMedicinesState>(
      builder: (context, state) {
        if (state is SystemMedicinesSuccess) {
          return GridView.builder(
            itemCount: state.systemMedicines.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 150 / 157,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routing.addMedicine,
                  arguments: {
                    'systemMedicine': state.systemMedicines[index],
                    'branchId': branchId,
                  },
                );
              },
              child: SystemMedicineCard(
                medicineModel: state.systemMedicines[index],
              ),
            ),
          );
        } else if (state is SystemMedicinesFailure) {
          return Center(
            child: ErrorApiWidget(message: state.apiErrorModel.message!),
          );
        } else {
          return Skeletonizer(
            effect: ShimmerEffect(),
            enabled: true,
            child: GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 150 / 157,
              ),
              itemBuilder: (context, index) => SystemMedicineCard(
                medicineModel: SystemMedicineModel(
                  code: '',
                  name: 'cjcn',
                  image:
                      "https://dkud4u09qff41.cloudfront.net/Products/ac84b8ac-e0e8-45e8-827f-7c7a3b0c5aca.jpeg",
                  type: '',
                  activePrincipal: 'jcjhcdjc',
                  companyName: 'cnasc ',
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
