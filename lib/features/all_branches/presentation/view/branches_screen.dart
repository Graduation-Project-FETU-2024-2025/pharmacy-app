import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_cubit.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view_model/cubit/get_branches/get_branches_state.dart';
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
                return SliverList.builder(
                  itemCount: state.branches.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 19.0),
                      child: BranchesCardItems(branches: state.branches[index]),
                    );
                  },
                );
              } else if (state is GetBranchesFailure) {
                return SliverToBoxAdapter(
                  child: Center(
                      child: Text(state.message,
                          style: TextStyle(color: Colors.red))),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox());
            },
          ),
        ],
      ),
    );
  }
}
