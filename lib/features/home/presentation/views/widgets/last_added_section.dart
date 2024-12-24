import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/features/home/presentation/views/widgets/last_added_list_view.dart';

import '../../../../../generated/l10n.dart';

class LastAddedSection extends StatelessWidget {
  const LastAddedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getIt<CacheHelper>().getCurrentLanguage() == 'en' ? 24.w : 0,
        right: getIt<CacheHelper>().getCurrentLanguage() == 'ar' ? 24.w : 0,
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
