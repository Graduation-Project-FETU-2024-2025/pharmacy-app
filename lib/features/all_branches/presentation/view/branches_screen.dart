import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/routers/routing.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/l10n.dart';
import 'widgets/branches_card_item.dart';
import 'widgets/custom_sliver_appbar.dart';

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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Text(S.of(context).allBranches, style: AppStyles.semiBold15),
            ),
          ),
          SliverList.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 19.0),
                  child: GestureDetector(
                    onTap: () => context.pushNamed(Routing.pharmacyDetail),
                    child: BranchesCardItems()),
                );
              }),
        ],
      ),
    );
  }
}
