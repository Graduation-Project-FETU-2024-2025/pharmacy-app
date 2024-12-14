import 'package:flutter/material.dart';
import 'branches_card_item.dart';

class BranchesCard extends StatelessWidget {
  const BranchesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom:19.0),
          child: BranchesCardItems(),
        );
      },
    );
  }
}



