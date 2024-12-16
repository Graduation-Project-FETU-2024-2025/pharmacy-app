import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/helpers/extentions.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import '../../../../core/database/cache/cashe_helper.dart';
import '../../../../core/services/get_it.dart';
import 'widgets/pharmacy_edit_body.dart';

class PharmacyEditScreen extends StatelessWidget {
  const PharmacyEditScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Pharmacy Information',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          onPressed: ()=>context.pop(), 
          icon: SizedBox(
            width: 40.w,
            child:getIt<CacheHelper>().getCurrentLanguage() == 'en' ? SvgPicture.asset(AppIcons.iconsBack , 
            colorFilter: ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ): SvgPicture.asset(AppIcons.iconsBackRight , 
            ),
          )),
      ),
      body: PharmacyEditBody(),
    );
  }
}
