import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import '../../../../core/database/cache/cashe_helper.dart';
import '../../../../core/services/get_it.dart';
import '../../../../generated/l10n.dart';
import 'widgets/branch_add_body.dart';

class BranchAddScreen extends StatelessWidget {
  const BranchAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          S.of(context).pharmacyInfo,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: SizedBox(
              child: getIt<CacheHelper>().getCurrentLanguage() == 'en'
                  ? SvgPicture.asset(
                      AppIcons.iconsBack,
                    )
                  : SvgPicture.asset(
                      AppIcons.iconsBackRight,
                    ),
            )),
      ),
      body: BranchAddBody(),
    );
  }
}
