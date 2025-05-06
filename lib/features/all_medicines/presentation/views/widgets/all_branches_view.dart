import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_cubit.dart';

import 'package:skeletonizer/skeletonizer.dart';

import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_state.dart';

import '../../../../../generated/l10n.dart';
import '../../view_models/cubit/get_branch_products_cubit.dart';
import 'all_branches_list_item.dart';

class AllBranchesView extends StatelessWidget {
  const AllBranchesView({super.key});

  @override
  Widget build(BuildContext context) {
    final getBranchProductsCubit = GetBranchProductsCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: BlocBuilder<GetBranchesCubit, GetBranchesState>(
        builder: (context, state) {
          if (state is GetBranchesSuccess) {
            if (state.branches.isEmpty) {
              return RefreshIndicator(
                onRefresh: () =>
                    context.read<GetBranchesCubit>().fetchBranches(),
                color: AppColors.primaryColor,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            AppImages.newNoData,
                          ),
                          Text(
                            S.of(context).noMedicineFound,
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () => context.read<GetBranchesCubit>().fetchBranches(),
              color: AppColors.primaryColor,
              child: ListView.builder(
                itemCount: state.branches.length,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    getBranchProductsCubit.getBranchProducts(
                      branchId: state.branches[index].id,
                    );
                  },
                  child: AllBranchListItem(
                    branchName: state.branches[index].branchName,
                  ),
                ),
              ),
            );
          } else if (state is GetBranchesFailure) {
            return RefreshIndicator(
              onRefresh: () => context.read<GetBranchesCubit>().fetchBranches(),
              color: AppColors.primaryColor,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Text(
                      state.apiErrorModel.message!,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Skeletonizer(
              enabled: true,
              effect: ShimmerEffect(
                baseColor: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.darkGray
                    : AppColors.lightGray,
              ),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => GestureDetector(
                  child: AllBranchListItem(
                    branchName: '',
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
