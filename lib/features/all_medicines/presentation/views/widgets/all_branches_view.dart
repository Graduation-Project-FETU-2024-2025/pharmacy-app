import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_cubit.dart';

import '../../view_models/cubit/get_branch_products_cubit.dart';

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
                child: Text('No Branches Found'),
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
          } else if (state is GetBranchesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Text('error'),
            );
          }
        },
      ),
    );
  }
}

class AllBranchListItem extends StatelessWidget {
  const AllBranchListItem({super.key, required this.branchName});
  final String branchName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                branchName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(),
              Icon(getIt.get<CacheHelper>().getCurrentLanguage() == 'ar'
                  ? Icons.arrow_back_ios
                  : Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
