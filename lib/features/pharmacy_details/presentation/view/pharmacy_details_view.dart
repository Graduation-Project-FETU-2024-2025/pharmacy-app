import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view/widgets/custom_sliver_appbar.dart';
import '../../../../core/services/get_it.dart';
import '../data/repo/get_one_branch_repo.dart';
import '../view_model/cubit/get_branches/get_one_branch_cubit.dart';
import 'widgets/pharmacy_detail_body.dart';

class PharmacyDetailsView extends StatelessWidget {
  const PharmacyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOneBranchCubit(
        getIt<GetOneBranchRepo>(), 
        'fc01d1d3-8e55-46f5-928e-a63a840ee90f',
      )..fetchOneBranch(),
      child: BlocBuilder<GetOneBranchCubit, GetOneBranchState>(
        builder: (context, state) {
          return Scaffold(
            body: state is GetOneBranchLoading
                ? const Center(child: CircularProgressIndicator())
                : state is GetOneBranchFailure
                    ? Center(child: Text('Error: ${state.message}'))
                    : state is GetOneBranchSuccess ? CustomScrollView(
                        slivers: [
                          CustomSliverAppBar(
                            img: state.branch.image,
                            isBtnValid: false,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          SliverToBoxAdapter(
                            child:  PharmacyDetailBody(branch: state.branch)
                          )
                          
                        ],
                      ): const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
