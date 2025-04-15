import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/services/get_it.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/features/all_branches/data/models/pharmacy_branch_model.dart';
import '../../../../core/database/cache/cashe_helper.dart';
import '../../../../generated/l10n.dart';
import 'widget/pharmacy_edit_body.dart';

class BranchEditView extends StatelessWidget {
  const BranchEditView({super.key, required this.branch});
  final PharmacyBranchModel branch;

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
      body: PharmacyEditBody(branch: branch),
    );
  }
}
