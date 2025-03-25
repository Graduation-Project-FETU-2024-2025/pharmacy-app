import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              return Center(
                child: Text(
                  S.of(context).noBranches,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }
            return ListView.builder(
              itemCount: state.branches.length,
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
            );
          } else if (state is GetBranchesFailure) {
            return Center(
              child: Text(
                S.of(context).somethingWrong,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          } else {
            return Skeletonizer(
              enabled: true,
              effect: ShimmerEffect(),
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
