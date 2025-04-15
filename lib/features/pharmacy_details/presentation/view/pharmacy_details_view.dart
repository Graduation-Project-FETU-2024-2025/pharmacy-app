import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view/widgets/custom_sliver_appbar.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/view_model/get_one_branch_cubit/get_one_branch_cubit.dart';
import 'package:pharmacy_app/features/pharmacy_details/presentation/view_model/get_one_branch_cubit/get_one_branch_state.dart';
import '../../../../core/services/get_it.dart';
import '../../../../generated/l10n.dart';
import '../../data/repo/get_one_branch_repo.dart';
import 'widgets/pharmacy_detail_body.dart';
import 'widgets/pharmacy_detail_shimmer.dart';

class PharmacyDetailsView extends StatelessWidget {
  const PharmacyDetailsView({super.key, required this.branchId});
  final String branchId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOneBranchCubit(
        getIt<GetOneBranchRepo>(),
        branchId,
      )..fetchOneBranch(),
      child: BlocBuilder<GetOneBranchCubit, GetOneBranchState>(
        builder: (context, state) {
          return Scaffold(
            body: state is GetOneBranchLoading
                ? PharmacyDetailShimmer()
                : state is GetOneBranchFailure
                    ? Center(
                        child: Text('${S.of(context).error}: ${state.apiErrorModel.message}'))
                    : state is GetOneBranchSuccess
                        ? CustomScrollView(
                            slivers: [
                              CustomSliverAppBar(
                                img: state.branch.image,
                                isBtnValid: false,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                              ),
                              SliverToBoxAdapter(
                                  child:
                                      PharmacyDetailBody(branch: state.branch))
                            ],
                          )
                        : const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
