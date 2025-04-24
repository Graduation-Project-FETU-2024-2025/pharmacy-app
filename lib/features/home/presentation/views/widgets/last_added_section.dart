import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/features/home/presentation/views/widgets/last_added_list_view.dart';

import '../../../../../generated/l10n.dart';

class LastAddedSection extends StatelessWidget {
  const LastAddedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 24.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).lastAdded,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 175.h,
            child: LastAddedListView(),
          ),
        ],
      ),
    );
  }
}
