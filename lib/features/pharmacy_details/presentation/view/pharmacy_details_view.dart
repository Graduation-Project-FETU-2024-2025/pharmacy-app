import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/all_branches/presentation/view/widgets/custom_sliver_appbar.dart';
import '../../../../core/utils/app_images.dart';
import 'widgets/pharmacy_detail_body.dart';

class PharmacyDetailsView extends StatelessWidget {
  const PharmacyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            img: AppImages.pharmacyDetailImg,
            isBtnValid: false,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          SliverToBoxAdapter(
            child: PharmacyDetailBody(),
          )
        ],
      ),
    );
  }
}
