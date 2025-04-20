import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_cubit.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_state.dart';
import '../../../../core/routers/routing.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/l10n.dart';
import 'widgets/branches_card_item.dart';
import 'widgets/custom_sliver_appbar.dart';
import 'widgets/shimmer_loading_branches.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            img: AppImages.imgMap,
            isBtnValid: true,
            height: MediaQuery.of(context).size.height * 0.4,
            isLocalImage: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child:
                  Text(S.of(context).allBranches, style: AppStyles.semiBold15),
            ),
          ),
          BlocBuilder<GetBranchesCubit, GetBranchesState>(
            builder: (context, state) {
              if (state is GetBranchesLoading) {
                return ShimmerLoadingBranches();
              } else if (state is GetBranchesSuccess) {
                if (state.branches.isEmpty) {
                  return SliverToBoxAdapter(
                      child: Image.asset(
                    AppImages.noData,
                    width: 300.w,
                    height: 300.h,
                  ));
                } else {
                  return SliverList.builder(
                    itemCount: state.branches.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 19.0),
                        child:
                            BranchesCardItems(branches: state.branches[index]),
                      );
                    },
                  );
                }
              } else if (state is GetBranchesFailure) {
                return SliverToBoxAdapter(
                  child: Center(
                      child: Text(state.apiErrorModel.message!,
                          style: TextStyle(color: Colors.red))),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox());
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.pushNamed(Routing.addBranch);
          if (result == true) {
            context.read<GetBranchesCubit>().fetchBranches();
          }
        },
        backgroundColor: AppColors.primaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
