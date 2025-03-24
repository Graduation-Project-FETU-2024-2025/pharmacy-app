import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/features/all_branches/data/models/pharmacy_branch_model.dart';
import '../../../../core/database/cache/cashe_helper.dart';
import '../../../../core/services/get_it.dart';
import '../../../../generated/l10n.dart';
import 'widgets/pharmacy_edit_body.dart';

class PharmacyEditScreen extends StatelessWidget {
  const PharmacyEditScreen({super.key, required this.branch});
  final PharmacyBranchModel? branch;

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
          onPressed: ()=>context.pop(), 
          icon: SizedBox(
            // width: 50.w,
            child:getIt<CacheHelper>().getCurrentLanguage() == 'en' ? SvgPicture.asset(AppIcons.iconsBack , 
            ): SvgPicture.asset(AppIcons.iconsBackRight , 
            ),
          )),
      ),
      body: PharmacyEditBody(branch : branch),
    );
  }
}
