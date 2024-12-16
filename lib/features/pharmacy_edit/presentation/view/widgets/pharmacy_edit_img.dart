import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_icons.dart';

class PharmacyEditImg extends StatelessWidget {
  const PharmacyEditImg({super.key, required this.pharmacyImg});
  final String pharmacyImg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 151.w, vertical: 30.h),
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage(pharmacyImg), fit: BoxFit.fill)),
        child: Align(
          alignment: Alignment(1.5.w, 1.5.h),
          child: Container(
            child: IconButton(
                onPressed: () {
                  //TODO
                },
                icon: SvgPicture.asset(AppIcons.iconsCamera)),
          ),
        ),
      ),
    );
  }
}
