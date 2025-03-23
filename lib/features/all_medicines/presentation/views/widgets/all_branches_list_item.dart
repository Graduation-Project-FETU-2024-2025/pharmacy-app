import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/database/cache/cashe_helper.dart';
import '../../../../../core/services/get_it.dart';

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
              Icon(getIt.get<CacheHelper>().getCurrentLanguage() == 'ar'
                  ? Icons.arrow_back_ios
                  : Icons.arrow_forward_ios),
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
