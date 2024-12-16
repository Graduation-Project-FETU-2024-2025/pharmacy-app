import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pharmacy_app/core/utils/app_colors.dart';
import 'package:pharmacy_app/core/utils/app_icons.dart';

class RowBtn extends StatelessWidget {
  const RowBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120.w,
          height: 36.h,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Color(0xffF24822)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            onPressed: () {},//TODO
            child: Text(
              'Delete',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 18, color: AppColors.white),
            ),
          ),
        ),
        Gap(35.w),
        SizedBox(
          width: 40.w,
          height: 40.h,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(AppColors.primaryColor),
              shape: WidgetStatePropertyAll(
                const CircleBorder(),
              ),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.all(10),
              ),
            ),
            onPressed: () {},//TODO
            child: SvgPicture.asset(
              AppIcons.iconsEdit,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.dst),
              )
          ),
        ),

      ],
    );
  }
}
