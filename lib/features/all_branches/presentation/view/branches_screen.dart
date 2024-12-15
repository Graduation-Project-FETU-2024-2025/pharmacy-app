import 'package:flutter/material.dart';
import '../../../../core/utils/app_styles.dart';
import 'widgets/branches_card_item.dart';
import 'widgets/custom_sliver_appbar.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Text('All Branches', style: AppStyles.semiBold15),
            ),
          ),
          SliverList.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 19.0),
                  child: BranchesCardItems(),
                );
              }),
        ],
      ),
    );
  }
}
