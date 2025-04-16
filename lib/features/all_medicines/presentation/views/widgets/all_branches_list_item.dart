import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllBranchListItem extends StatelessWidget {
  const AllBranchListItem({super.key, required this.branchName});
  final String branchName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                branchName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
