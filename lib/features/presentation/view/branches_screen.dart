import 'package:flutter/material.dart';
import 'widgets/branches_view_body.dart';
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
            child: BranchesViewBody(),
          )
        ],
      ),
    );
  }
}



