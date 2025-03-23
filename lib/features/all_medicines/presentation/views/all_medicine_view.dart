import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/view_models/cubit/get_branch_products_cubit.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/views/widgets/all_medicine_view_body.dart';

class AllMedicineView extends StatelessWidget {
  const AllMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    final getbranchproductscubit = GetBranchProductsCubit.get(context);
    return SafeArea(
      child: BlocBuilder<GetBranchProductsCubit, GetBranchProductsState>(
        builder: (context, state) {
          return Scaffold(
            body: AllMedicineViewBody(),
            floatingActionButton: state is GetBranchProductsSuccess
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.h,
                      horizontal: 8.w,
                    ),
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.primaryColor,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routing.systemMedicine,
                            arguments: getbranchproductscubit.currentBranchId);
                      },
                    ),
                  )
                : SizedBox(),
          );
        },
      ),
    );
  }
}
