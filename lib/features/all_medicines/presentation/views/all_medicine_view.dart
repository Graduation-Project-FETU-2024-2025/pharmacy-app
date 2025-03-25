import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/features/all_branches/data/repo/get_branches_repo.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_cubit.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/view_models/cubit/get_branch_products_cubit.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/views/widgets/all_branches_view.dart';
import 'package:pharmacy_app/features/all_medicines/presentation/views/widgets/all_medicine_view_body.dart';

class AllMedicineView extends StatelessWidget {
  const AllMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    final getbranchproductscubit = GetBranchProductsCubit.get(context);
    return SafeArea(
      child: BlocBuilder<GetBranchProductsCubit, GetBranchProductsState>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (didPop) return;

              if (getbranchproductscubit.state is! (
                GetBranchProductsSelectBranch,
              )) {
                getbranchproductscubit.selectBranch();
              } else {
                Navigator.of(context).maybePop();
              }
            },
            child: Scaffold(
              body: state is GetBranchProductsSelectBranch
                  ? BlocProvider(
                      create: (context) =>
                          GetBranchesCubit(getIt<GetBranchesRepo>())
                            ..fetchBranches(),
                      child: AllBranchesView(),
                    )
                  : AllMedicineViewBody(),
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
                              arguments:
                                  getbranchproductscubit.currentBranchId);
                        },
                      ),
                    )
                  : SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
