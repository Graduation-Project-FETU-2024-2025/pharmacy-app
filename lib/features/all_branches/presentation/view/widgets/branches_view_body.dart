import 'package:flutter/widgets.dart';
import 'package:pharmacy_app/core/utils/app_styles.dart';
import 'branch_card.dart';

class BranchesViewBody extends StatelessWidget {
  const BranchesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text('All Branches', style: AppStyles.semiBold15),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: BranchesCard()),
        ],
      ),
    );
  }
}












