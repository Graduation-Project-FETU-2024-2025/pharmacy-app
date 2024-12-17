import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';
import 'package:pharmacy_app/features/profile/presentation/view/widgets/change_language_dialog.dart';
import 'package:pharmacy_app/generated/l10n.dart';

class ProfileOptionContainer extends StatelessWidget {
  const ProfileOptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.gray, width: 1.5.w),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: ChangeLanguageDialog(),
                ),
              );
            },
            leading: SvgPicture.asset(AppIcons.iconsLanguage),
            title: Text(
              S.of(context).language,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(AppIcons.iconsTheme),
            title: Text(
              S.of(context).darkMode,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset(AppIcons.iconsLogout),
            title: Text(
              S.of(context).logout,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
